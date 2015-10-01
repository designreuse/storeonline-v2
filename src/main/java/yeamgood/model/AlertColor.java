package yeamgood.model;

/**
 * Created by YeamGood on 11/6/2558.
 */
public enum AlertColor {

    ALERT_SUCCESS("alert-success"),
    ALERT_DANGER("alert-danger"),
    ALERT_ERROR("alert-error"),
    ALERT_INFO("alert-info"),
    ALERT_WARNING("alertwarning");

    private String alertColor;
    private AlertColor(String alertColor) {
         this.alertColor = alertColor;
    }

    //    @Override
    public String toString() {
        if(this.alertColor != null) {
            return this.alertColor;
        } else {
            return "";
        }
    }
}
