package dingpiao.model;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "t_passenger")
public class Passenger {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    private String IDNumber;

    private String phone;

    private int halfPrice;

    private int insurance;

    private int withChild;

    private int status;

    @ManyToOne
    @JoinColumn(name = "user")
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIDNumber() {
        return IDNumber;
    }

    public void setIDNumber(String IDNumber) {
        this.IDNumber = IDNumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIsWithChildren() {
        return withChild;
    }

    public void setIsWithChildren(int isWithChildren) {
        this.withChild = isWithChildren;
    }

    public int getInsurance() {
        return insurance;
    }

    public void setInsurance(int insurance) {
        this.insurance = insurance;
    }

    public int getHalfPrice() {
        return halfPrice;
    }

    public void setHalfPrice(int halfPrice) {
        this.halfPrice = halfPrice;
    }

    public int getWithChild() {
        return withChild;
    }

    public void setWithChild(int withChild) {
        this.withChild = withChild;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
