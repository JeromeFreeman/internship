package org.library.entity;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 读者类型
 */
public class ReaderType {

    private int id;

    /**
     * 读者类别名称
     */
    private String name;

    /**
     * 类型读者可借阅图书数量
     */
    private int number;

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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "ReaderType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", number=" + number +
                '}';
    }
}
