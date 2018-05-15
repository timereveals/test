package dingpiao.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "t_schedule")
public class Schedule {

    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    @JoinColumn(name = "route")
    private Route route;

    @ManyToOne
    @JoinColumn(name = "bus")
    private Bus bus;

    private Date leaveTime;

    private Date arriveTime;

    private double price;

    @OneToMany(cascade = CascadeType.REMOVE)
    private List<Ticket> tickets;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }

    public Date getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }

    public Date getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(Date arriveTime) {
        this.arriveTime = arriveTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

}
