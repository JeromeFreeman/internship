package org.library.entity;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 权限表（1、0）
 */
public class Purview {

    /**
     * 用户编号
     */
    private int id;

    /**
     * 系统设置权限
     */
    private short sysset;

    /**
     * 读者管理权限
     */
    private short readerset;

    /**
     * 图书管理权限
     */
    private short bookset;

    /**
     * 图书借还权限
     */
    private short borrowback;

    /**
     * 系统查询权限
     */
    private short sysquery;

    /**
     * 管理员信息(姓名)
     */
    private Manager manager;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public short getSysset() {
        return sysset;
    }

    public void setSysset(short sysset) {
        this.sysset = sysset;
    }

    public short getReaderset() {
        return readerset;
    }

    public void setReaderset(short readerset) {
        this.readerset = readerset;
    }

    public short getBookset() {
        return bookset;
    }

    public void setBookset(short bookset) {
        this.bookset = bookset;
    }

    public short getBorrowback() {
        return borrowback;
    }

    public void setBorrowback(short borrowback) {
        this.borrowback = borrowback;
    }

    public short getSysquery() {
        return sysquery;
    }

    public void setSysquery(short sysquery) {
        this.sysquery = sysquery;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    @Override
    public String toString() {
        return "Purview{" +
                "id=" + id +
                ", sysset=" + sysset +
                ", readerset=" + readerset +
                ", bookset=" + bookset +
                ", borrowback=" + borrowback +
                ", sysquery=" + sysquery +
                '}';
    }
}
