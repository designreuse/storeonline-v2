package yeamgood.model;

import javax.persistence.*;

@Entity
@Table(name = "warehouse_product")
public class WarehouseProduct {

    @Id
    @GeneratedValue
    private int warehouseProductID;

    @ManyToOne
    @JoinColumn(name="warehouseID")
    private WareHouse warehouse;

    @ManyToOne
    @JoinColumn(name="productID")
    private Product product;

    private int unitsInStock;

    @Transient
    private String unitsInStockText;

    public int getWarehouseProductID() {
        return warehouseProductID;
    }

    public void setWarehouseProductID(int warehouseProductID) {
        this.warehouseProductID = warehouseProductID;
    }

    public WareHouse getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(WareHouse warehouse) {
        this.warehouse = warehouse;
    }

    public int getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(int unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getUnitsInStockText() {
        return unitsInStockText;
    }

    public void setUnitsInStockText(String unitsInStockText) {
        this.unitsInStockText = unitsInStockText;
    }
}