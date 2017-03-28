package org.library.entity;

/**
 * Created by ${Fjq} on 2017-03-15.
 */
public class BookType {

    /**
     * 类别id
     */
    private int id;

    /**
     * 类别名称
     */
    private String typename;

    /**
     * 可借阅天数
     */
    private int days;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    @Override
    public String toString() {
        return "BookType{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                ", days=" + days +
                '}';
    }
}
