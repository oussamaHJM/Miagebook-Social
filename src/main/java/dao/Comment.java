package dao;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "COMMENTS")
public class Comment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idComment;
    @ManyToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name = "CODE_STATUS")
    private Status status;
    private Date publishDate;
    @ManyToOne
    @JoinColumn(name = "CODE_WRITER")
    private User writer;
    private String text;

    public Comment() {
    }

    public Comment(Comment comment, User writer, Status Status) {
        this.writer = writer;
        this.status = Status;
    }

    public Comment(String text, Date date){
        this.text = text;
        this.publishDate = date;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public User getWriter() {
        return writer;
    }

    public void setWriter(User writer) {
        this.writer = writer;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
