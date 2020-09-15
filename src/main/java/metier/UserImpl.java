package metier;

import dao.Comment;
import dao.Status;
import dao.User;
import security.AES;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;


public class UserImpl implements userInterface {
    private EntityManager entityManager;
    private EntityManagerFactory entityManagerFactory;

    public UserImpl() {
        entityManagerFactory = Persistence.createEntityManagerFactory("UP_MIAGEBOOK");
        entityManager = entityManagerFactory.createEntityManager();
    }

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public boolean subscribe(User user) {
        try {
            if (!entityManager.isOpen()) {
                entityManager = entityManagerFactory.createEntityManager();
            }
        } catch (NullPointerException ex) {
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if (!transaction.isActive())
            transaction.begin();
        String pseudo;
        try {
            Query query;
            try {
                query = entityManager.createQuery("select u.pseudo from User u where u.pseudo = :pseudo");
                query.setParameter("pseudo", user.getPseudo());
                pseudo = (String) query.getSingleResult();
            } catch (NoResultException ex) {
                user.setPassword(AES.encrypt(user.getPassword(),"oulaaaaaaaaaa c la cle secrete"));
                entityManager.persist(user);
                transaction.commit();
                entityManager.close();
                return true;
            }
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
        entityManager.close();
        return false;
    }

    @Override
    public User login(String pseudo, String password) {
        try {
            if (!entityManager.isOpen()) {
                entityManager = entityManagerFactory.createEntityManager();
            }
        } catch (NullPointerException ex) {
            entityManager = entityManagerFactory.createEntityManager();
        }
        entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        if (!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", pseudo);
            System.out.println("Login" + pseudo);
            System.out.println("Password" + AES.encrypt(password,"oulaaaaaaaaaa c la cle secrete"));
            User user = null;
            try {
                user = (User) query.getSingleResult();
            } catch (NoResultException ex) {
                entityManager.close();
                return null;
            }
            if (user != null && user.getPassword().equals(AES.encrypt(password,"oulaaaaaaaaaa c la cle secrete"))) {
                transaction.commit();
                entityManager.close();
                return user;
            }
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
        entityManager.close();
        return null;
    }

    @Override
    public boolean logout(String pseudo) {
        return false;
    }

    @Override
    public boolean addFriend(User user, User newFriend) {
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", user.getPseudo());
            user = (User) query.getSingleResult();
            query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", newFriend.getPseudo());
            newFriend = (User) query.getSingleResult();
            user.getFrnds().add(newFriend);
            entityManager.merge(user);
            transaction.commit();
            return true;
        }catch (Exception e){
            transaction.rollback();
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean removeFriend(User user, User oldFriend) {
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", user.getPseudo());
            user = (User) query.getSingleResult();
            query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", oldFriend.getPseudo());
            oldFriend = (User) query.getSingleResult();
            user.getFrnds().remove(oldFriend);
            entityManager.merge(user);
            transaction.commit();
            return true;
        }catch (Exception e){
            transaction.rollback();
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> getFriends(User user) {
        System.out.println("Ana f bedia dial ADD friend DAO");
        try {
            if (!entityManager.isOpen()) {
                entityManager = entityManagerFactory.createEntityManager();
            }
        } catch (NullPointerException ex) {
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if (!transaction.isActive())
            transaction.begin();
        List<User> friends = new ArrayList<User>();
        try {
            System.out.println("9bl nl9a User");
            Query query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", user.getPseudo());
            user = (User) query.getSingleResult();
            System.out.println("l9it User");
            friends = user.getFriends();
            friends.addAll(user.getFriendOf());
            friends = new ArrayList<User>(new LinkedHashSet<User>(friends));
            entityManager.close();
            return friends;
        } catch (Exception e) {
            transaction.rollback();
            //e.printStackTrace();
        }
        entityManager.close();
        return null;
    }

    @Override
    public List<User> getAllUsers() {
        try {
            if (!entityManager.isOpen()) {
                entityManager = entityManagerFactory.createEntityManager();
            }
        } catch (NullPointerException ex) {
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if (!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from User u");
            List<User> users = query.getResultList();
            entityManager.close();
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            entityManager.close();
            return null;
        }
    }

    @Override
    public boolean publishStatus(User publisher, Status status) {
        try {
            if (!entityManager.isOpen()) {
                entityManager = entityManagerFactory.createEntityManager();
            }
        } catch (NullPointerException ex) {
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if (!transaction.isActive())
            transaction.begin();
        User user = null;
        try {
            Query query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", publisher.getPseudo());
            publisher = (User) query.getSingleResult();
            //System.out.println("*******"+publisher.getIdUser()+"*******");
            entityManager.persist(new Status(status, publisher));
            transaction.commit();
            entityManager.close();
            return true;
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
            entityManager.close();
            return false;
        }
    }

    @Override
    public User getUserByPseudo(String pseudo){
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        User   user = null;
        try {
            Query query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            query.setParameter("pseudo", pseudo);
            user = (User) query.getSingleResult();
            return user;
        }catch (Exception e){
            transaction.rollback();
            e.printStackTrace();
            entityManager.close();
            return null;
        }
    }

    @Override
    public boolean addComment(User user, Status status, Comment comment) {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            //System.out.println(user.getPseudo());
            Query query = entityManager.createQuery("select u from User u where u.pseudo = :pseudo");
            //System.out.println(user.getPseudo());
            query.setParameter("pseudo", user.getPseudo());
            user = (User) query.getSingleResult();
            query = entityManager.createQuery("select s from Status s where s.idStatus = :ids");
            query.setParameter("ids", status.getIdStatus());
            status = (Status) query.getSingleResult();
            comment.setWriter(user);
            comment.setStatus(status);
            status.getComments().add(comment);
            for (Comment comment1 : status.getComments()){
                System.out.println("*****************"+comment1.getText()+"******************");
            }
            entityManager.persist(status);
            entityManager.close();
            return true;
        }catch (Exception e){
            transaction.rollback();
            e.printStackTrace();
            entityManager.close();
            return false;
        }
    }

    @Override
    public List<Status> getAllStatus() {
        try {
            if (!entityManager.isOpen()) {
                entityManager = entityManagerFactory.createEntityManager();
            }
        } catch (NullPointerException ex) {
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if (!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from Status u");
            List<Status> statuses = query.getResultList();
            entityManager.close();
            return statuses;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            entityManager.close();
            return null;
        }
    }

    @Override
    public Status getStatusById(int id) {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from Status u where u.idStatus = :ids");
            query.setParameter("ids", id);
            Status status = (Status) query.getSingleResult();
            entityManager.close();
            return status;
        }catch (Exception e){
            transaction.rollback();
            e.printStackTrace();
            entityManager.close();
            return null;
        }
    }

    @Override
    public List<Comment> getCommentsByStatusId(int id) {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        User   user = null;
        try {
            Status status = getStatusById(id);
            List<Comment> comments = status.getComments();
            entityManager.close();
            return comments;
        }catch (Exception e){
            transaction.rollback();
            e.printStackTrace();
            entityManager.close();
            return null;
        }
    }

    @Override
    public boolean setConnected(String pseudo) {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from User u where u.pseudo =: psd");
            query.setParameter("psd", pseudo);
            User user = (User) query.getSingleResult();
            user.setIsConnected(true);
            entityManager.persist(user);
            transaction.commit();
            entityManager.close();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            entityManager.close();
            return false;
        }
    }

    @Override
    public boolean setDisconnected(String pseudo) {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from User u where u.pseudo =: psd");
            query.setParameter("psd", pseudo);
            User user = (User) query.getSingleResult();
            user.setIsConnected(false);
            entityManager.persist(user);
            transaction.commit();
            entityManager.close();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            entityManager.close();
            return false;
        }
    }

    @Override
    public List<User> getConnectedUsers() {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from User u where u.isConnected =: psd");
            query.setParameter("psd", true);
            List<User> onlineUsers = query.getResultList();
            transaction.commit();
            entityManager.close();
            return onlineUsers;
        }catch (Exception e){
            e.printStackTrace();
            entityManager.close();
            return null;
        }
    }

    public EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }

    @Override
    public List<Status> getStatus(User user) {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select stat from Status stat where stat.publisher.pseudo =: idPub");
            query.setParameter("idPub", user.getPseudo());
            List<Status> statuses =query.getResultList();
            entityManager.close();
            return statuses;
        }catch (Exception e){
            e.printStackTrace();
            entityManager.close();
            return null;
        }
    }


    public List<Comment> getComments(Status status) {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u.comments from Status u");
            List<Comment> comments =query.getResultList();
            entityManager.close();
            return comments;
        }catch (Exception e){
            e.printStackTrace();
            entityManager.close();
            return null;
        }
    }

    @Override
    public List<Status> getRecentStatus() {
        try {
            if(!entityManager.isOpen()){
                entityManager = entityManagerFactory.createEntityManager();
            }
        }catch (NullPointerException ex){
            entityManager = entityManagerFactory.createEntityManager();
        }
        List<Status> recentStatus = new ArrayList<Status>();
        EntityTransaction transaction = entityManager.getTransaction();
        if(!transaction.isActive())
            transaction.begin();
        try {
            Query query = entityManager.createQuery("select u from Status u order by u.publishDate desc");
            query.setMaxResults(10);
            recentStatus.addAll(query.getResultList());
            transaction.commit();
            return recentStatus;
        }catch (Exception e){
            transaction.rollback();
            e.printStackTrace();
        }
        return null;
    }
}
