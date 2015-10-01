package yeamgood.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "log")
public class Log {

    @Id
    @GeneratedValue
    private int logID;

    private String logType;
    private String key;
    private String action;
    private String createDate;
    private String createUser;

}