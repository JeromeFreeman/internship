package org.library.dao;

import org.library.entity.BookInfo;
import org.library.entity.Borrow;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-20.
 */
public interface QueryDao {
    /**
     * 查询的是已到期未归还的图书信息 ifback=0 and backTime<now()
     * 展示的信息包含图书条形码，图书名称，读者条形码，读者名称，借阅时间，应还时间Borrow
     */
    List<Borrow> queryOut();

    /**
     * 可选择的查询依据包括，图书条形码，图书名称，读者条形码，读者姓名
     * 也可以选择借阅时间  显示的内容包含
     */
    List<Borrow> queryBorrow(Borrow borrow);

    /**
     * 可以选择要查询的内容，包含条形码，类别，书名，作者，出版社，书架
     * 显示的内容  条形码，图书名称，图书类型，出版社，书架
     */
    List<BookInfo> queryBook(BookInfo bookInfo);
}
