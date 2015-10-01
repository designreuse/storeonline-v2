package yeamgood.model;

/**
 * Created by YeamGood on 12/6/2558.
 */
public enum AlertContent {

    SAVE_SUSCESS("บันทึกข้อมูลเสร็จสิ้น"),
    DUPLICATE("ข้อมูลซ้ำในระบบ"),
    DELETE_SUSCESS("ลบข้อมูลเสร็จสิ้น");

    private String alertContent;
    private AlertContent(String alertContent) {
        this.alertContent = alertContent;
    }

    //    @Override
    public String toString() {
        if(this.alertContent != null) {
            return this.alertContent;
        } else {
            return "";
        }
    }

}
