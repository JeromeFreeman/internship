package org.library.entity;

import java.util.Date;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 归还记录
 */
public class GiveBack {

    /**
     * 归还记录id
     */
    private int id;

    /**
     * 读者id
     */
    private int readerid;

    /**
     * 图书id
     */
    private int bookid;

    /**
     * 还书时间
     */
    private Date backTime;

    /**
     * 操作员
     */
    private String operator;

    /**
     * 图书信息
     */
    private BookInfo bookInfo;

    /**
     * 读者信息
     */
    private Reader reader;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReaderid() {
        return readerid;
    }

    public void setReaderid(int readerid) {
        this.readerid = readerid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public Date getBackTime() {
        return backTime;
    }

    public void setBackTime(Date backTime) {
        this.backTime = backTime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    @Override
    public String toString() {
        return "GiveBack{" +
                "id=" + id +
                ", readerid=" + readerid +
                ", bookid=" + bookid +
                ", backTime=" + backTime +
                ", operator='" + operator + '\'' +
                ", bookInfo=" + bookInfo +
                ", reader=" + reader +
                '}';
    }
}
