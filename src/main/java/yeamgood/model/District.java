package yeamgood.model;

import javax.persistence.*;

@Entity
@Table(name = "districts")
public class District {

    @Id
    @GeneratedValue
    @Column(name = "district_id")
    private int districtID;

    @Column(name = "district_code")
    private String districtCode;

    @Column(name = "district_name")
    private String districtName;

    @Column(name = "amphur_id")
    private int amphurID;

    @Column(name = "province_id")
    private int provinceID;

    @Column(name = "geo_id")
    private int geoID;

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public int getAmphurID() {
        return amphurID;
    }

    public void setAmphurID(int amphurID) {
        this.amphurID = amphurID;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public int getGeoID() {
        return geoID;
    }

    public void setGeoID(int geoID) {
        this.geoID = geoID;
    }
}
