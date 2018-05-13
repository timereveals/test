package dingpiao.model;

import org.hibernate.annotations.JoinColumnOrFormula;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_route")
public class Route {

    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    @JoinColumn(name = "leavestation")
    private Station leaveStation;

    @ManyToOne
    @JoinColumn(name = "arrivestation")
    private Station arriveStation;

    private String passby;

    private double distance;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Station getLeaveStation() {
        return leaveStation;
    }

    public void setLeaveStation(Station leaveStation) {
        this.leaveStation = leaveStation;
    }

    public Station getArriveStation() {
        return arriveStation;
    }

    public void setArriveStation(Station arriveStation) {
        this.arriveStation = arriveStation;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPassby() {
        return passby;
    }

    public void setPassby(String passby) {
        this.passby = passby;
    }
}
