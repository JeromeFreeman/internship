package org.library.service.impl;

import org.library.dao.BorrowDao;
import org.library.entity.BookInfo;
import org.library.entity.Borrow;
import org.library.entity.Reader;
import org.library.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-19.
 */
@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowDao borrowDao;

    /**
     * 读者验证（通过读者条形码，来查询读者信息
     * 可借数量(===通过该读者类型可借数量-读者已借未还数量)）
     * 1、连表查reader、readerType 通过barcode
     * 2、通过读者id查询来查borrow，读者未还书的数量ifback=0
     * 3、通过json传输reader对象
     * @param barcode
     * @return
     */
    public Reader borrowReader(String barcode) {
        Reader reader = borrowDao.borrowReader(barcode);
        System.out.println(reader);
        //数据库中没找到多返回null
        if(reader!=null){
            int borrowNumber = borrowDao.borrowNumber(reader.getId());
            int number = reader.getReaderType().getNumber()-borrowNumber;
            if (number>0){
                reader.setNumber(number);
                return reader;
            }else{
                //对象中number属性初始值为0
                return reader;
            }
        }
        return null;
    }

    public Date afterMonth(){
        Calendar cal = Calendar.getInstance();
        //下面的就是把当前日期加一个月
        cal.add(Calendar.MONTH, 1);
        System.out.println("增加月份后的日期："+cal.getTime());
        return cal.getTime();
        //SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        //System.out.println("today is:" + format.format(Calendar.getInstance().getTime()));
        //System.out.println("yesterday is:" + format.format(cal.getTime()));
    }

    public List<Borrow> renewBook(int readerid) {
        Calendar date = Calendar.getInstance();
        date.set(Calendar.DATE, date.get(Calendar.DATE)+3);
        Date threeDayAgo =  date.getTime();
        System.out.println("三天后："+threeDayAgo);
        return borrowDao.renewBook(readerid,threeDayAgo);
    }

    public List<Borrow> rebackBook(int readerid) {
        return borrowDao.renewBook(readerid,null);
    }

    /**
     * 1、续借更新借阅表ifBack==0---->1
     * 2、通过id查Borrow信息
     * 3、再插入新的借阅信息completeBorrow
     * @param borrowId
     * @return
     */
    @Transactional
    public int completeRenew(List<Integer> borrowId) {
        int updateRenew = borrowDao.updateRenew(borrowId);
        if (updateRenew!=0){
            List<Borrow> borrows = borrowDao.backRenew(borrowId);
            for (Borrow borrow:borrows) {
                borrow.setBorrowTime(new Date());
                borrow.setBackTime(afterMonth());
                borrowDao.completeBorrow(borrow);
            }
            System.out.println(borrows);
            return borrowId.size();
        }else{
            return 0;
        }
    }

    /**
     * 完成归还
     * @param borrowId
     * @return
     */
    public int completeReBack(List<Integer> borrowId) {
        return borrowDao.completeReBack(borrowId);
    }

    /**
     * 1、根据条形码查图书信息
     * 2、根据图书名称查图书信息
     * 通过json传输book信息
     * @return
     */
    public BookInfo barcodeBook(String barcode) {
        BookInfo bookInfo = borrowDao.barcodeBook(barcode);
        if (bookInfo!=null){
            SimpleDateFormat name = new SimpleDateFormat("yyyy/MM/dd");
            String nowDate = name.format(new Date());
            String afterMonth = name.format(afterMonth());
            System.out.println("增加月份后的日期："+afterMonth);
            bookInfo.setBorrowTime(nowDate);
            bookInfo.setBackTime(afterMonth);
        }
        return bookInfo;
    }

    public BookInfo nameBook(String bookname) {
        BookInfo bookInfo = borrowDao.nameBook(bookname);
        if (bookInfo!=null){
            SimpleDateFormat name = new SimpleDateFormat("yyyy/MM/dd");
            String nowDate = name.format(new Date());//返回String类型
            String afterMonth = name.format(afterMonth());
            bookInfo.setBorrowTime(nowDate);
            bookInfo.setBackTime(afterMonth);
        }
        return bookInfo;
    }

    public int completeBorrow(Borrow borrow) {
        return borrowDao.completeBorrow(borrow);
    }
}
