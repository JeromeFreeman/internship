package org.library.dto;

import org.library.entity.BookInfo;

/**
 * Created by ${Fjq} on 2017-03-19.
 */
public class BorrowBook {

    /**
     * 1、没有该条形码的图书信息
     * 2、没有该名称的图书信息
     * 3、当返回信息不止一条时，报错处理（暂时不处理）
     */
    private int state;

    private String stateInfo;//返回结果xx

    private BookInfo bookInfo;

    public BorrowBook(int state , String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public BorrowBook() {
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }
}
