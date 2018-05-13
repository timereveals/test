package dingpiao.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_word")
public class Word {
    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    @JoinColumn(name = "user")
    private User user;
    //留言内容
    private String word_content;
    //留言时间
    private Date word_time;
    //回复内容
    private String reply_content;
    //回复时间
    private Date reply_time;
    //留言状态
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getWord_content() {
        return word_content;
    }

    public void setWord_content(String word_content) {
        this.word_content = word_content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getWord_time() {
        return word_time;
    }

    public void setWord_time(Date word_time) {
        this.word_time = word_time;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public Date getReply_time() {
        return reply_time;
    }

    public void setReply_time(Date reply_time) {
        this.reply_time = reply_time;
    }
}
