package yeamgood.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "purchaseOrder")
public class PurchaseOrder {

    @Id
    @GeneratedValue
    private int purchaseOrderID;

    private String purchaseCode;
    private Date purchaseDate;
  /*  private int supplierID;*/
    private Date requiredDate;
    private String referenceNumber;
    private String remark;
    private Double vat;

    @ManyToOne
    @JoinColumn(name="supplierID")
    private Supplier supplier;

    @Transient
    private String purchaseDateText;

    @Transient
    private String requiredDateText;

    @Transient
    private int supplierID;

    @Transient
    private List<PurchaseOrderProduct> purchaseOrderProductList = new ArrayList<PurchaseOrderProduct>();

    public int getPurchaseOrderID() {
        return purchaseOrderID;
    }

    public void setPurchaseOrderID(int purchaseOrderID) {
        this.purchaseOrderID = purchaseOrderID;
    }

    public String getPurchaseCode() {
        return purchaseCode;
    }

    public void setPurchaseCode(String purchaseCode) {
        this.purchaseCode = purchaseCode;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }


    public Date getRequiredDate() {
        return requiredDate;
    }

    public void setRequiredDate(Date requiredDate) {
        this.requiredDate = requiredDate;
    }

    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Double getVat() {
        return vat;
    }

    public void setVat(Double vat) {
        this.vat = vat;
    }

    public String getPurchaseDateText() {
        return purchaseDateText;
    }

    public void setPurchaseDateText(String purchaseDateText) {
        this.purchaseDateText = purchaseDateText;
    }

    public String getRequiredDateText() {
        return requiredDateText;
    }

    public void setRequiredDateText(String requiredDateText) {
        this.requiredDateText = requiredDateText;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public List<PurchaseOrderProduct> getPurchaseOrderProductList() {
        return purchaseOrderProductList;
    }

    public void setPurchaseOrderProductList(List<PurchaseOrderProduct> purchaseOrderProductList) {
        this.purchaseOrderProductList = purchaseOrderProductList;
    }
}