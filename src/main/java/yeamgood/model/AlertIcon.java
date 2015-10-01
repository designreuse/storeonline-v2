package yeamgood.model;

/**
 * Created by YeamGood on 12/6/2558.
 */
public enum AlertIcon {

    FA_CHECK("fa-check"),
    FA_DELETE("fa-trash"),
    FA_WARNING("fa-warning"),
    FA_SAVE("fa-save");

    private String alertIcon;
    private AlertIcon(String alertIcon) {
        this.alertIcon = alertIcon;
    }

    //    @Override
    public String toString() {
        if(this.alertIcon != null) {
            return this.alertIcon;
        } else {
            return "";
        }
    }
}
