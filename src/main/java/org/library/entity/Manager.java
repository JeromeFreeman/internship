package org.library.entity;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 管理员信息
 */
public class Manager {

    private int id;

    private String name;

    private String PWD;

    private Purview purview;

    public Purview getPurview() {
        return purview;
    }

    public void setPurview(Purview purview) {
        this.purview = purview;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPWD() {
        return PWD;
    }

    public void setPWD(String PWD) {
        this.PWD = PWD;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", PWD='" + PWD + '\'' +
                '}';
    }
}
