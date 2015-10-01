package yeamgood.model;

import javax.persistence.*;

@Entity
@Table(name = "geography")
public class GeoGraphy {

    @Id
    @GeneratedValue
    @Column(name = "geo_id")
    private int geoID;

    @Column(name = "geo_name")
    private String geoName;

    public int getGeoID() {
        return geoID;
    }

    public void setGeoID(int geoID) {
        this.geoID = geoID;
    }

    public String getGeoName() {
        return geoName;
    }

    public void setGeoName(String geoName) {
        this.geoName = geoName;
    }
}
