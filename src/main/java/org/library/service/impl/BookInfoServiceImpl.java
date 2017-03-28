package org.library.service.impl;

import org.library.dao.BookInfoDao;
import org.library.entity.BookInfo;
import org.library.entity.BookType;
import org.library.entity.Bookcase;
import org.library.entity.Publishing;
import org.library.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-15.
 */
@Service
public class BookInfoServiceImpl implements BookInfoService {

    @Autowired
    private BookInfoDao bookInfoDao;

    public List<BookInfo> bookRank() {
        return bookInfoDao.bookRank();
    }


    /**
     * 书架的增删改查
     */
    public List<Bookcase> cases() {
        return bookInfoDao.cases();
    }

    public int caseModify(Bookcase bookcase) {
        return bookInfoDao.caseModify(bookcase);
    }

    public int caseDel(int id) {
        return bookInfoDao.caseDel(id);
    }

    public int addCase(Bookcase bookcase) {
        return bookInfoDao.addCase(bookcase);
    }

    /**
     * 图书管理的增删改查
     */
    public List<BookInfo> books() {
        return bookInfoDao.books();
    }

    public int addBook(BookInfo bookInfo) {
        return bookInfoDao.addBook(bookInfo);
    }

    public int setBook(BookInfo bookInfo) {
        return bookInfoDao.setBook(bookInfo);
    }

    public int delBook(int id) {
        return bookInfoDao.delBook(id);
    }


    /**
     * 图书选择类型下拉框展示查询
     * 1、图书类型
     * 2、出版社
     * 3、书架
     */
    public List<Publishing> publishing() {
        return bookInfoDao.publishing();
    }

    public List<BookType> bookType() {
        return bookInfoDao.bookType();
    }

    public int addBookType(BookType bookType) {
        return bookInfoDao.addBookType(bookType);
    }

    public int setBookType(BookType bookType) {
        return bookInfoDao.setBookType(bookType);
    }

    public int delBookType(int id) {
        return bookInfoDao.delBookType(id);
    }
}
