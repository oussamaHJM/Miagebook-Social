package dao;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "STATUS")
public class Status implements Serializable {
    @Id
    @Column(name = "ID_STATUS")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idStatus;
    private String title;
    private String text;
    private Date publishDate;
    @ManyToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name = "CODE_PUBLISHER")
    private User publisher;
    @OneToMany(mappedBy = "status", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Comment> comments;


    public Status() {
    }
    public Status(String text, String title, Date publishDate){
        this.text = text;
        this.title = title;
        this.publishDate = publishDate;
    }

    public Status(Status status, User publisher){
        this.title = status.title;
        this.text = status.text;
        this.publishDate = status.publishDate;
        this.publisher = publisher;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public User getWriter() {
        return publisher;
    }

    public void setWriter(User publisher) {
        this.publisher = publisher;
    }

    public List<Comment> getCommentList() {
        return comments;
    }

    public void setCommentList(List<Comment> comments) {
        this.comments = comments;
    }

    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    public User getPublisher() {
        return publisher;
    }

    public void setPublisher(User publisher) {
        this.publisher = publisher;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
