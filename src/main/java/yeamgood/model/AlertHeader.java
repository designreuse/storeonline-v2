package yeamgood.model;

/**
 * Created by YeamGood on 12/6/2558.
 */
public enum AlertHeader {

    INFO("แจ้งเตือน");

    private String alertHeader;
    private AlertHeader(String alertHeader) {
        this.alertHeader = alertHeader;
    }

    //    @Override
    public String toString() {
        if(this.alertHeader != null) {
            return this.alertHeader;
        } else {
            return "";
        }
    }

}
