package org.library.entity;

import java.util.Date;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 借阅记录
 */
public class Borrow {

    /**
     * 借阅记录id
     */
    private int id;

    /**
     * 读者id;
     */
    private int readerid;

    /**
     * 图书id
     */
    private int bookid;

    /**
     * 借阅时间
     */
    private Date borrowTime;

    /**
     * 应还时间
     */
    private Date backTime;

    /**
     * 借阅时间
     */
    private String begin;

    /**
     * 应还时间
     */
    private String end;

    /**
     * 操作人
     */
    private String operator;

    /**
     * 是否还书 1-还 0-未还
     */
    private short ifback;

    /**
     * 借阅图书信息
     */
    private BookInfo bookInfo;

    /**
     * 读者信息
     */
    private Reader reader;

    /**
     * 查询类型
     */
    private int queryType;

    /**
     * 查询内容
     */
    private String queryCont;

    public String getBegin() {
        return begin;
    }

    public void setBegin(String begin) {
        this.begin = begin;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public int getQueryType() {
        return queryType;
    }

    public void setQueryType(int queryType) {
        this.queryType = queryType;
    }

    public String getQueryCont() {
        return queryCont;
    }

    public void setQueryCont(String queryCont) {
        this.queryCont = queryCont;
    }

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

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
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

    public short getIfback() {
        return ifback;
    }

    public void setIfback(short ifback) {
        this.ifback = ifback;
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
        return "Borrow{" +
                "id=" + id +
                ", readerid=" + readerid +
                ", bookid=" + bookid +
                ", borrowTime=" + borrowTime +
                ", backTime=" + backTime +
                ", operator='" + operator + '\'' +
                ", ifback=" + ifback +
                ", bookInfo=" + bookInfo +
                ", reader=" + reader +
                ", queryType=" + queryType +
                ", queryCont='" + queryCont + '\'' +
                '}';
    }
}
