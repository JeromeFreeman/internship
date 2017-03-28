package org.library.entity;

import java.util.Date;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 图书信息
 */
public class BookInfo {

    /**
     * 图书id
     */
    private int id;

    /**
     * 条形码
     */
    private String barcode;

    /**
     * 图书名称
     */
    private String bookname;

    /**
     * 类型id
     */
    private int typeid;

    /**
     * 作者
     */
    private String author;

    /**
     * 翻译者
     */
    private String translator;

    /**
     * 出版社
     */
    private String ISBN;

    /**
     * 价格
     */
    private float price;

    /**
     * 页码
     */
    private int page;

    /**
     * 书架id
     */
    private int bookcaseId;

    /**
     * 入库时间
     */
    private Date inTime;

    /**
     * 操作员
     */
    private String operator;

    /**
     * 借阅次数
     */
    private short del;

    /**
     * 书架信息
     */
    private Bookcase bookcase;

    /**
     * 图书类别信息
     */
    private BookType bookType;

    /**
     *  出版社信息
     */
    private Publishing publishing;

    private String borrowTime;

    private String backTime;

    /**
     * 查询类型
     */
    private int queryType;

    /**
     * 查询内容
     */
    private String queryCont;

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

    public String getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public String getBackTime() {
        return backTime;
    }

    public void setBackTime(String backTime) {
        this.backTime = backTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public short getDel() {
        return del;
    }

    public void setDel(short del) {
        this.del = del;
    }

    public int getBookcaseId() {
        return bookcaseId;
    }

    public void setBookcaseId(int bookcaseId) {
        this.bookcaseId = bookcaseId;
    }

    public Bookcase getBookcase() {
        return bookcase;
    }

    public void setBookcase(Bookcase bookcase) {
        this.bookcase = bookcase;
    }

    public BookType getBookType() {
        return bookType;
    }

    public void setBookType(BookType bookType) {
        this.bookType = bookType;
    }

    public Publishing getPublishing() {
        return publishing;
    }

    public void setPublishing(Publishing publishing) {
        this.publishing = publishing;
    }

    @Override
    public String toString() {
        return "BookInfo{" +
                "id=" + id +
                ", barcode='" + barcode + '\'' +
                ", bookname='" + bookname + '\'' +
                ", typeid=" + typeid +
                ", author='" + author + '\'' +
                ", translator='" + translator + '\'' +
                ", ISBN='" + ISBN + '\'' +
                ", price=" + price +
                ", page=" + page +
                ", bookcaseId=" + bookcaseId +
                ", inTime=" + inTime +
                ", operator='" + operator + '\'' +
                ", del=" + del +
                ", bookcase=" + bookcase +
                ", bookType=" + bookType +
                ", publishing=" + publishing +
                '}';
    }
}
