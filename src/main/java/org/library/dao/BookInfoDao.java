package org.library.dao;

import org.library.entity.BookInfo;
import org.library.entity.BookType;
import org.library.entity.Bookcase;
import org.library.entity.Publishing;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 图书借阅排行榜
 */
public interface BookInfoDao {

    /**
     * 按借阅次数排序查询
     * @return
     */
    List<BookInfo> bookRank();

    /**
     * 书架查询
     */
    List<Bookcase> cases();

    /**
     * 书架修改
     */
    int caseModify(Bookcase bookcase);

    /**
     * 书架删除
     */
    int caseDel(int id);

    /**
     * 增加书架
     */
    int addCase(Bookcase bookcase);

    /**
     * 图书管理的增删改查
     */
    List<BookInfo> books();

    int addBook(BookInfo bookInfo);

    int setBook(BookInfo bookInfo);

    int delBook(int id);

    /**
     * 图书选择查询
     * 1、图书类型
     * 2、出版社
     * 3、书架
     */
    //List<Bookcase> cases();
    List<Publishing> publishing();
    List<BookType> bookType();

    /**
     * 添加类型
     */
    int addBookType(BookType bookType);

    /**
     * 修改类型
     */
    int setBookType(BookType bookType);

    int delBookType(int id);
}
