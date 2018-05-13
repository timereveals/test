package dingpiao.model;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "t_order")
public class Order {

    @Id
    @GeneratedValue
    private int id;

    private Date createtime;

    @ManyToOne
    @JoinColumn(name = "user")
    private User user;

    @OneToMany
    private List<Passenger> passenger;

    @OneToMany
    private List<Ticket> tickets;

    private double totalPrice;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<Passenger> getPassenger() {
        return passenger;
    }

    public void setPassenger(List<Passenger> passenger) {
        this.passenger = passenger;
    }
}
