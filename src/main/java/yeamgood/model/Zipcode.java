package yeamgood.model;

import javax.persistence.*;

@Entity
@Table(name = "zipcodes")
public class Zipcode {

    @Id
    @GeneratedValue
    @Column(name = "zipcode_id")
    private int id;

    @Column(name = "district_code")
    private String districtCode;

    @Column(name = "zipcode")
    private String zipcode;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
}
