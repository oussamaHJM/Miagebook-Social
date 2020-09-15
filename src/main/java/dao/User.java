package dao;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "USERS")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUser;
    private String pseudo;
    private String password;
    private String nom;
    private String prenom;
    private String email;
    private Boolean isConnected;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="tbl_friends",
            joinColumns={@JoinColumn(name="userId")},
            inverseJoinColumns={@JoinColumn(name="friendId")}
    )
    private List<User> friends;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="tbl_friends",
            joinColumns={@JoinColumn(name="friendId")},
            inverseJoinColumns={@JoinColumn(name="userId")}
    )
    private List<User> friendOf;
    @OneToMany(mappedBy = "publisher", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Status> feed;

    public User() {
    }
    public User(String pseudo, String password, String nom, String prenom, String email) {
        this.pseudo = pseudo;
        this.password = password;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
    }

    public User(String oussama12, String s, String s1, String oussama) {
        this.setPseudo(oussama12);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Boolean getIsConnected() {
        return isConnected;
    }

    public void setIsConnected(Boolean connected) {
        isConnected = connected;
    }

    public List<User> getFrnds(){
        return this.friends;
    }

    public List<User> getFriends() {
        List<User> friends = new ArrayList<User>();
        friends = this.friends;
        friends.addAll(this.getFriendOf());
        friends = new ArrayList<User>(new LinkedHashSet<User>(friends));
        return friends;
    }

    public void setFriends(List<User> friends) {
        this.friends = friends;
    }

    public List<Status> getFeed() {
        return feed;
    }

    public void setFeed(List<Status> feed) {
        this.feed = feed;
    }

    public List<User> getFriendOf() {
        return friendOf;
    }

    public void setFriendOf(List<User> friendOf) {
        this.friendOf = friendOf;
    }

    @Override
    public boolean equals(Object o) {
        // self check
        if (this == o)
            return true;
        // null check
        if (o == null)
            return false;
        // type check and cast
        if (getClass() != o.getClass())
            return false;
        User person = (User) o;
        // field comparison
        return Objects.equals(pseudo, person.pseudo);
    }
}
