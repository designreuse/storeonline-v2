package yeamgood.model;

/**
 * Created by YeamGood on 10/6/2558.
 */
public class AlertMessage {

    private String icon;
    private String header;
    private String content;
    private String color;

    public AlertMessage() {
    }

    public AlertMessage(String icon,String header,String content,String color){
        this.icon = icon;
        this.header = header;
        this.content = content;
        this.color = color;
    }

    public AlertMessage(AlertIcon icon,AlertHeader header,AlertContent content,AlertColor color){
        this.icon = icon!=null?icon.toString():"";
        this.header = header!=null?header.toString():"";
        this.content = content!=null?content.toString():"";
        this.color = color!=null?color.toString():"";
    }

    public void saveSuccess(){
        this.icon = AlertIcon.FA_SAVE.toString();
        this.header = AlertHeader.INFO.toString();
        this.content = AlertContent.SAVE_SUSCESS.toString();
        this.color = AlertColor.ALERT_SUCCESS.toString();
    }

    public void deleteSuccess(){
        this.icon = AlertIcon.FA_DELETE.toString();
        this.header = AlertHeader.INFO.toString();
        this.content = AlertContent.DELETE_SUSCESS.toString();
        this.color = AlertColor.ALERT_SUCCESS.toString();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
