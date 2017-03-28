package org.library.service;

import org.library.entity.BookInfo;
import org.library.entity.Borrow;
import org.library.entity.Reader;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-19.
 * 图书借阅板块
 */
public interface BorrowService {

    /**
     * 读者验证（通过读者条形码，来查询读者信息
     * 可借数量(===通过该读者类型可借数量-读者已借未还数量)）
     * 1、连表查reader、readerType 通过barcode
     * 2、通过读者id查询来查borrow，读者未还书的数量ifback=0
     * 3、通过json传输reader对象
     */
    Reader borrowReader(String barcode);


    /**
     * 查询该读者到期前三天的图书信息
     */
    List<Borrow> renewBook(int readerid);

    /**
     * 当只传readerid时，查该读者所有未还书信息
     */
    List<Borrow> rebackBook(int readerid);

    /**
     * 1、根据条形码查图书信息
     * 2、根据图书名称查图书信息
     * 通过json传输book信息
     */
    //BorrowBook borrowBook(String choosetype, String bookCondition);


    /**
     * 根据图书条形码查图书信息
     */
    BookInfo barcodeBook(String barcode);

    /**
     * 根据图书名称查图书信息
     */
    BookInfo nameBook(String bookname);

    /**
     * 插入借阅表,完成借阅
     */
    int completeBorrow(Borrow borrow);

    /**
     * 1、续借更新借阅表ifBack==0---->1
     * 2、通过id查Borrow信息
     * 3、再插入新的借阅信息completeBorrow
     * @param borrowId
     * @return
     */
    int completeRenew(List<Integer> borrowId);

    /**
     * 更新ifback==1   backTime=now()
     */
    int completeReBack(List<Integer> borrowId);
}
