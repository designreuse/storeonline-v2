package yeamgood.model;

import javax.persistence.*;

@Entity
@Table(name = "amphurs")
public class Amphur {

    @Id
    @GeneratedValue
    @Column(name = "amphur_id")
    private int amphurID;

    @Column(name = "amphur_code")
    private String amphurCode;

    @Column(name = "amphur_name")
    private String amphurName;

    @Column(name = "geo_id")
    private int geoID;

    @Column(name = "province_id")
    private int provinceID;

    public int getAmphurID() {
        return amphurID;
    }

    public void setAmphurID(int amphurID) {
        this.amphurID = amphurID;
    }

    public String getAmphurCode() {
        return amphurCode;
    }

    public void setAmphurCode(String amphurCode) {
        this.amphurCode = amphurCode;
    }

    public String getAmphurName() {
        return amphurName;
    }

    public void setAmphurName(String amphurName) {
        this.amphurName = amphurName;
    }

    public int getGeoID() {
        return geoID;
    }

    public void setGeoID(int geoID) {
        this.geoID = geoID;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }
}
