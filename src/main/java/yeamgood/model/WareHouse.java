package yeamgood.model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by YeamGood on 17/6/2558.
 */

@Entity
@Table(name = "warehouse")
public class WareHouse {

    @Id
    @GeneratedValue
    private int warehouseID;

    private String warehouseName;
    private String dealer;
    private String telephone;
    private String address;
    private String description;
    private String active;

    @OneToMany(mappedBy = "warehouse" , fetch= FetchType.EAGER)
    private List<WarehouseProduct> warehouseProductList;

    public int getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public String getDealer() {
        return dealer;
    }

    public void setDealer(String dealer) {
        this.dealer = dealer;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public List<WarehouseProduct> getWarehouseProductList() {
        return warehouseProductList;
    }

    public void setWarehouseProductList(List<WarehouseProduct> warehouseProductList) {
        this.warehouseProductList = warehouseProductList;
    }
}
