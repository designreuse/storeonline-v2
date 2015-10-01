package yeamgood.model;

import javax.persistence.*;

@Entity
@Table(name = "provinces")
public class Province {

    @Id
    @GeneratedValue
    @Column(name = "province_id")
    private int provinceID;

    @Column(name = "province_code")
    private String provinceCode;

    @Column(name = "province_name")
    private String provinceName;

    @Column(name = "geo_id")
    private int geoID;

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public int getGeoID() {
        return geoID;
    }

    public void setGeoID(int geoID) {
        this.geoID = geoID;
    }
}
