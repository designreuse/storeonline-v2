package yeamgood.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "purchaseOrderProduct")
public class PurchaseOrderProduct {

    @Id
    @GeneratedValue
    private int purchaseOrderProductID;

    private int purchaseOrderID;
    private int amount;
    private BigDecimal price;

    @ManyToOne
    @JoinColumn(name="productID")
    private Product product;

    public int getPurchaseOrderProductID() {
        return purchaseOrderProductID;
    }

    public void setPurchaseOrderProductID(int purchaseOrderProductID) {
        this.purchaseOrderProductID = purchaseOrderProductID;
    }

    public int getPurchaseOrderID() {
        return purchaseOrderID;
    }

    public void setPurchaseOrderID(int purchaseOrderID) {
        this.purchaseOrderID = purchaseOrderID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}