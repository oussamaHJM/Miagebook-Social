package web;

import dao.User;
import metier.UserImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginControllerServlet extends HttpServlet {
    private UserImpl metier;
    @Override
    public void init() throws ServletException {
        metier = new UserImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String thePage = null;
        String action = request.getParameter("action");
        if (action != null){
            if(action.equals("subscribe")){
                String pseudo = request.getParameter("pseudo");
                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                User user = new User(pseudo, password, nom, prenom, email);
                user.setIsConnected(true);
                if(!metier.subscribe(user)){
                    request.setAttribute("subscribeException", "Pseudo already used");
                }
            }else if (action.equals("login")) {
                String pseudo = request.getParameter("pseudo");
                String password = request.getParameter("password");
                User user = metier.login(pseudo, password);
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("pseudo", user.getPseudo());
                    session.setAttribute("prenom", user.getPrenom());
                    session.setAttribute("nom", user.getNom());
                    session.setAttribute("user", user);
                    request.setAttribute("user", user);
                    metier.setConnected(user.getPseudo());
                    thePage = "/profile";
                } else {
                    request.setAttribute("loginException", "Pseudo or password not found");
                }
            }
        }
        if(request.getServletPath().equals("/login") && thePage==null) {
            thePage = "vues/login.jsp";
        }
        else if (request.getServletPath().equals("/subscribe") && thePage==null){
            thePage = "vues/subscribe.jsp";
        }else if (request.getServletPath().equals("/logout") && thePage==null){
            try{
                metier.setDisconnected((String) request.getSession(false).getAttribute("pseudo"));

                HttpSession session = request.getSession();
                session.removeAttribute("user");
                session.removeAttribute("pseudo");
                session.removeAttribute("prenom");
                session.removeAttribute("nom");
                session.invalidate();
            }catch (Exception ex){

            }
            thePage = "/login";
        }
        System.out.println("**************THE PAGE :"+thePage+"***********************");
        request.getRequestDispatcher(thePage).forward(request, response);
        return;
    }
}
