package org.library.entity;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 出版信息
 */
public class Publishing {
    /**
     * 出版编号
     */
    private String ISBN;

    /**
     * 出版社名称
     */
    private String pubname;

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getPubname() {
        return pubname;
    }

    public void setPubname(String pubname) {
        this.pubname = pubname;
    }

    @Override
    public String toString() {
        return "Publishing{" +
                "ISBN='" + ISBN + '\'' +
                ", pubname='" + pubname + '\'' +
                '}';
    }
}
