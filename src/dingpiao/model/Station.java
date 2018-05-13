package dingpiao.model;

import javax.persistence.*;

@Entity
@Table(name = "t_station")
public class Station {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    private String locationBrief;

    private String locationDetail;

    private String phone;

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

    public String getLocationBrief() {
        return locationBrief;
    }

    public void setLocationBrief(String locationBrief) {
        this.locationBrief = locationBrief;
    }

    public String getLocationDetail() {
        return locationDetail;
    }

    public void setLocationDetail(String locationDetail) {
        this.locationDetail = locationDetail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
