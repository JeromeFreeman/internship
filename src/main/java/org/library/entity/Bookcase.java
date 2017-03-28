package org.library.entity;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 书架表
 */
public class Bookcase {

    /**
     * 书架id
     */
    private int id;

    /**
     * 书架名称
     */
    private String name;

    private char Column_3;

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

    public char getColumn_3() {
        return Column_3;
    }

    public void setColumn_3(char column_3) {
        Column_3 = column_3;
    }

    @Override
    public String toString() {
        return "Bookcase{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", Column_3=" + Column_3 +
                '}';
    }
}
