package yeamgood.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "recieptOrder")
public class RecieptOrder {

    @Id
    @GeneratedValue
    private int recieptOrderID;

    private String recieptCode;
    private Date recieptDate;
    private String referenceNumber;
    private String remark;
    private Double vat;

    @ManyToOne
    @JoinColumn(name="supplierID")
    private Supplier supplier;

    @Transient
    private String recieptDateText;

    @Transient
    private List<RecieptOrderProduct> recieptOrderProductList = new ArrayList<RecieptOrderProduct>();

    public int getRecieptOrderID() {
        return recieptOrderID;
    }

    public void setRecieptOrderID(int recieptOrderID) {
        this.recieptOrderID = recieptOrderID;
    }

    public String getRecieptCode() {
        return recieptCode;
    }

    public void setRecieptCode(String recieptCode) {
        this.recieptCode = recieptCode;
    }

    public Date getRecieptDate() {
        return recieptDate;
    }

    public void setRecieptDate(Date recieptDate) {
        this.recieptDate = recieptDate;
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

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public String getRecieptDateText() {
        return recieptDateText;
    }

    public void setRecieptDateText(String recieptDateText) {
        this.recieptDateText = recieptDateText;
    }

    public List<RecieptOrderProduct> getRecieptOrderProductList() {
        return recieptOrderProductList;
    }

    public void setRecieptOrderProductList(List<RecieptOrderProduct> recieptOrderProductList) {
        this.recieptOrderProductList = recieptOrderProductList;
    }

    public Double getVat() {
        return vat;
    }

    public void setVat(Double vat) {
        this.vat = vat;
    }
}