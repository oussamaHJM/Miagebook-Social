package web;

import dao.Comment;
import dao.Status;
import dao.User;
import metier.UserImpl;
import metier.userInterface;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

public class ControllerUserServlet extends HttpServlet {
    private userInterface metier;

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
        String thepage = null;
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("addComment")) {
                thepage = "vues/feed.jsp";
            }
            if (action.equals("allComments")) {
                Status status = metier.getStatusById(Integer.parseInt(request.getParameter("idStatus")));
                request.setAttribute("status", status);
                request.setAttribute("comments", metier.getCommentsByStatusId(Integer.parseInt(request.getParameter("idStatus"))));
                for (Comment comment : status.getComments()) {
                    System.out.println("Comment :" + comment.getText());
                }
                thepage = "vues/allComments.jsp";
            }
            if (action.equals("addStatus")) {
                User user = (User) request.getSession(false).getAttribute("user");
                Status status = new Status();
                status.setText(request.getParameter("text"));
                status.setTitle(request.getParameter("title"));
                status.setPublishDate(new Date());
                status.setPublisher(user);
                if (!metier.publishStatus(user, status)) {
                    request.setAttribute("addStatusException", "status is not published");
                }
            }
            if (action.equals("profile")) {
                User user = (User) request.getSession(false).getAttribute("user");
                request.setAttribute("user", user);
                request.setAttribute("friends", metier.getFriends(user));
                thepage = "vues/profile.jsp";
            }
            if (action.equals("getAllUsers")) {
                request.setAttribute("users", metier.getAllUsers());
            }
        }
        if (request.getServletPath().equals("/profile") && thepage == null) {
            User user;
            try {
                user = (User) request.getSession(false).getAttribute("user");
                request.setAttribute("user", user);
                request.setAttribute("friends", metier.getFriends(user));
                thepage = "vues/profile.jsp";
            } catch (NullPointerException exception) {
                thepage = "./login";
            }

        } else if (request.getServletPath().equals("/listUsers")) {
            try {
                List<User> friends = metier.getFriends((User) request.getSession(false).getAttribute("user"));
                List<User> all = metier.getAllUsers();
                List<User> nonFriends=new ArrayList<>();
                List<User> connectedFriends = new ArrayList<>();
                List<User> connectedNonFriends = new ArrayList<>();
                User user = (User) request.getSession(false).getAttribute("user");
                System.out.println(all.size());

                nonFriends = findRemove(user.getPseudo(), all);
                nonFriends.removeAll(friends);


                request.setAttribute("nonFriends", nonFriends);
                request.setAttribute("friends", friends);
                /*request.setAttribute("onlineFriends", friendson);
                request.setAttribute("onlineUsers", userson);*/
                thepage = "vues/listUsers.jsp";
            } catch (Exception e) {
                e.printStackTrace();
                thepage = "./login";
            }


        } else if (request.getServletPath().equals("/addStatus") && thepage == null) {
            thepage = "vues/addStatus.jsp";
        } else if (request.getServletPath().equals("/feed") && thepage == null) {
            try {
                User user = (User) request.getSession(false).getAttribute("user");
                request.setAttribute("status", metier.getStatus(user));
                thepage = "vues/feed.jsp";
            } catch (NullPointerException exception) {
                thepage = "vues/login.jsp";
            }
        } else if (request.getServletPath().equals("/addComment") && thepage == null) {
            try {
                User user = (User) request.getSession(false).getAttribute("user");
                Status status = new Status();
                status.setIdStatus(Integer.parseInt(request.getParameter("idStatus")));
                Comment comment = new Comment();
                comment.setPublishDate(new Date());
                comment.setText(request.getParameter("text"));
                if (metier.addComment(user, status, comment))
                    System.out.println("**SUCCESS**");
                thepage = "/feed";
            } catch (Exception e) {
                thepage = "vues/login.jsp";
            }
        } else if (request.getServletPath().equals("/allComments") && thepage == null) {
            Status status = metier.getStatusById(Integer.parseInt(request.getParameter("idStatus")));
            request.setAttribute("staut", status);
            request.setAttribute("comments", status.getComments());
            thepage = "vues/allComments.jsp";
        } else if (request.getServletPath().equals("/recentStatus") && thepage == null) {
            request.setAttribute("status", metier.getRecentStatus());
            thepage = "vues/recentStatus.jsp";
        }
        System.out.println("--------------THE PAGE : " + thepage + "----------------");
        request.getRequestDispatcher(thepage).forward(request, response);
    }


    public List<User> findRemove(String pseudo, List<User> users) {
        Iterator<User> iterator = users.iterator();
        while (iterator.hasNext()) {
            User user = iterator.next();
            if (user.getPseudo().equals(pseudo)) {
                users.remove(user);
                return users;
            }
        }
        return null;
    }

    public List<User> getnonFriends(List<User> friends, List<User> All){
        All.removeAll(friends);
        return All;
    }

}