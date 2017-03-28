package org.library.dao;

import org.apache.ibatis.annotations.Param;
import org.library.entity.BookInfo;
import org.library.entity.Borrow;
import org.library.entity.Reader;

import java.util.Date;
import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-19.
 */
public interface BorrowDao {

    /**
     * 通过barcode查读者
     */
    Reader borrowReader(String barcode);

    /**
     * 通过id查读者已借未还数量
     */
    int borrowNumber(int id);

    /**
     * 根据图书条形码查图书信息
     */
    BookInfo barcodeBook(String barcode);

    /**
     * 根据图书名称查图书信息
     */
    BookInfo nameBook(String bookname);

    /**
     * 插入借阅表
     */
    int completeBorrow(Borrow borrow);

    /**
     * 查询该读者到期前三天的图书信息(当只传readerid时，查该读者所有未还书信息)
     */
    List<Borrow> renewBook(@Param("readerid") int readerid,@Param("threeDayAgo") Date threeDayAgo);


    /**
     * 续借更新借阅表ifBack==0---->1
     */
    int updateRenew(List<Integer> borrowId);

    /**
     * 通过id查Borrow信息
     */
    List<Borrow> backRenew(List<Integer> borrowId);

    //再插入新的借阅信息completeBorrow

    /**
     * 完成归还  、更新ifback==1   backTime=now()
     *方法同updateRenew()这里重复了
     */
    int completeReBack(List<Integer> borrowId);

}
