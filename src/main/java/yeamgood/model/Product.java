package yeamgood.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue
    private int productID;

    private String productCode;
    private String productName;
    private String description;
    private BigDecimal unitCost;
    private BigDecimal unitPrice;
    private int unitsInStock;
    private int unitsOnOrder;
    private int pointOfOrder;
    private String active;

    @Transient
    private String brandID;
    @Transient
    private String catagoryID;
    @Transient
    private String unitID;


    @ManyToOne
    @JoinColumn(name="brandID")
    private Brand brand;
    @ManyToOne
    @JoinColumn(name="catagoryID")
    private Catagory catagory;
    @ManyToOne
    @JoinColumn(name="unitID")
    private Unit unit;

    @Lob
    private byte[] picture;

    @OneToMany(mappedBy = "product" , fetch= FetchType.EAGER)
    private List<WarehouseProduct> warehouseProductList;

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Catagory getCatagory() {
        return catagory;
    }

    public void setCatagory(Catagory catagory) {
        this.catagory = catagory;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public BigDecimal getUnitCost() {
        return unitCost;
    }

    public void setUnitCost(BigDecimal unitCost) {
        this.unitCost = unitCost;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(int unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    public int getUnitsOnOrder() {
        return unitsOnOrder;
    }

    public void setUnitsOnOrder(int unitsOnOrder) {
        this.unitsOnOrder = unitsOnOrder;
    }

    public int getPointOfOrder() {
        return pointOfOrder;
    }

    public void setPointOfOrder(int pointOfOrder) {
        this.pointOfOrder = pointOfOrder;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }

    public List<WarehouseProduct> getWarehouseProductList() {
        return warehouseProductList;
    }

    public void setWarehouseProductList(List<WarehouseProduct> warehouseProductList) {
        this.warehouseProductList = warehouseProductList;
    }

    public String getBrandID() {
        return brandID;
    }

    public void setBrandID(String brandID) {
        this.brandID = brandID;
    }

    public String getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(String catagoryID) {
        this.catagoryID = catagoryID;
    }

    public String getUnitID() {
        return unitID;
    }

    public void setUnitID(String unitID) {
        this.unitID = unitID;
    }
}