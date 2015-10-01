package yeamgood.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "recieptOrderProduct")
public class RecieptOrderProduct {

    @Id
    @GeneratedValue
    private int recieptOrderProductID;

    private int recieptOrderID;
    private int amount;
    private BigDecimal price;

    @ManyToOne
    @JoinColumn(name="productID")
    private Product product;

    public int getRecieptOrderProductID() {
        return recieptOrderProductID;
    }

    public void setRecieptOrderProductID(int recieptOrderProductID) {
        this.recieptOrderProductID = recieptOrderProductID;
    }

    public int getRecieptOrderID() {
        return recieptOrderID;
    }

    public void setRecieptOrderID(int recieptOrderID) {
        this.recieptOrderID = recieptOrderID;
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