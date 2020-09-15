package metier;

import dao.Comment;
import dao.Status;
import dao.User;

import java.util.List;

public interface userInterface {
    public boolean subscribe(User user);
    public User login(String pseudo, String password);
    public boolean logout(String pseudo);
    public boolean addFriend(User user, User newFriend);
    public boolean removeFriend(User user, User oldFriend);
    public List<User> getFriends(User user);
    public List<User> getAllUsers();
    public boolean publishStatus(User publisher, Status status);
    public List<Status> getStatus(User user);
    public List<Status> getRecentStatus();
    public User getUserByPseudo(String pseudo);
    public boolean addComment(User user, Status status, Comment comment);
    public List<Status> getAllStatus();
    public Status getStatusById(int id);
    public List<Comment> getCommentsByStatusId(int id);
    public boolean setConnected(String pseudo);
    public boolean setDisconnected(String pseudo);
    public List<User> getConnectedUsers();

}
