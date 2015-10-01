package yeamgood.model;

import javax.persistence.*;

@Entity
@Table(name = "unit")
public class Unit {

    @Id
    @GeneratedValue
    private int unitID;

    private String unitCode;
    private String unitName;
    private String active;

    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public String getUnitCode() {
        return unitCode;
    }

    public void setUnitCode(String unitCode) {
        this.unitCode = unitCode;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }
}