package service;

import dao.Status;
import dao.User;
import metier.UserImpl;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/user")
public class UserRestService {
    private UserImpl metier = new UserImpl();

    @GET
    @Path("/all")
    @Produces(MediaType.TEXT_PLAIN)
    public String getIt() {
        System.out.println("mliii7a");
        return "Got it!";
    }

    @Path("/addFriend/{user}/{friend}")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String addFriend(@PathParam(value = "user") String user, @PathParam(value = "friend") String friend) {
        User user1 = new User();
        user1.setPseudo(user);
        User friend1 = new User();
        friend1.setPseudo(friend);
        if (metier.addFriend(user1, friend1)) {
            return "true";
        }
        return "false";
    }

    @Path("/removeFriend/{user}/{friend}")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String removeFriend(@PathParam(value = "user") String userPseudo, @PathParam(value = "friend") String friendPseudo){
        System.out.println("ana daba dkhalt l api remove");
        User user = new User();
        user.setPseudo(userPseudo);
        User friend = new User();
        friend.setPseudo(friendPseudo);
        if (metier.removeFriend(user, friend)){
            return "true";
        }
        return "false";
    }
    @Path("/allStatus")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public List<Status> getAllStatus(User User){
        return metier.getStatus(User);
    }
}
