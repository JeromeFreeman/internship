package org.library.web;

import org.library.dto.MessageResult;
import org.library.entity.BookInfo;
import org.library.entity.Borrow;
import org.library.entity.Reader;
import org.library.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-19.
 */
@Controller
public class BorrowController {

    @Autowired
    private BorrowService borrowService;

    @ResponseBody
    @RequestMapping(value = "borrowReader/{barcode}",method = RequestMethod.GET)
    public MessageResult<Reader> borrowReader(@PathVariable("barcode") String barcode){
        Reader borrowReader = borrowService.borrowReader(barcode);
        if (borrowReader==null){
            //未查找到该读者信息
            return new MessageResult<Reader>(false,"未查找到该读者信息");
        }else if(borrowReader.getNumber()==0){
            return new MessageResult<Reader>(false,"该读者借书数量超出规定");
        }else {
            return new MessageResult<Reader>(true,borrowReader);
        }
    }

    @ResponseBody
    @RequestMapping(value = "borrowBook",method = RequestMethod.GET)
    public MessageResult<BookInfo> borrowBook(String choosetype, String bookCondition){
        System.out.println("选择的类型="+choosetype+"  内容="+bookCondition);
        if (choosetype.equals("barcode")){
            BookInfo bookInfo = borrowService.barcodeBook(bookCondition);
            if (bookInfo==null){
                return new MessageResult<BookInfo>(false,"没有该条形码的图书信息");
            }else{
                return new MessageResult<BookInfo>(true,bookInfo);
            }
        }else{
            BookInfo bookInfo = borrowService.nameBook(bookCondition);
            if (bookInfo==null){
                return new MessageResult<BookInfo>(false,"没有该图书名称的图书信息");
            }else{
                return new MessageResult<BookInfo>(true,bookInfo);
            }
        }
    }

    @ResponseBody
    @RequestMapping(value = "completeBorrow",method = RequestMethod.POST)
    public MessageResult<Borrow> completeBorrow(Borrow borrow){
        System.out.println(borrow);
        int completeBorrow = borrowService.completeBorrow(borrow);
        if (completeBorrow!=0){
            return new MessageResult<Borrow>(true,borrow);
        }else {
            return new MessageResult<Borrow>(false,"系统错误，借阅失败");
        }
    }


    @RequestMapping(value = "renewBookInfo/{barcode}",method = RequestMethod.GET)
    public String renewBookInfo(@PathVariable("barcode") String barcode, HttpServletRequest request){
        Reader reader = borrowService.borrowReader(barcode);
        if (reader==null){
            request.setAttribute("error","查无此人");
        }else {
            request.setAttribute("bReader",reader);
            List<Borrow> renewBooks = borrowService.renewBook(reader.getId());
            System.out.println(renewBooks);
            request.setAttribute("renewBooks",renewBooks);
        }
        return "renew";
    }

    @RequestMapping(value = "rebackBookInfo/{barcode}",method = RequestMethod.GET)
    public String rebackBookInfo(@PathVariable("barcode") String barcode, HttpServletRequest request){
        Reader reader = borrowService.borrowReader(barcode);
        if (reader==null){
            request.setAttribute("error","查无此人");
        }else {
            request.setAttribute("rebackReader",reader);
            List<Borrow> rebackBooks = borrowService.rebackBook(reader.getId());
            System.out.println(rebackBooks);
            request.setAttribute("rebackBooks",rebackBooks);
        }
        return "reback";
    }

    @ResponseBody
    @RequestMapping(value = "renewBook",method = RequestMethod.POST)
    public MessageResult<Borrow> renewBook(String borrowId){
        System.out.println(borrowId);
        String[] split = borrowId.split(",");
        List<Integer> borrowIds = new ArrayList();
        for (int i=0;i<split.length;i++){
            borrowIds.add(Integer.parseInt(split[i]));
        }
        System.out.println(borrowId);
        int completeRenew = borrowService.completeRenew(borrowIds);
        if (completeRenew!=0){
            return new MessageResult<Borrow>(true,new Borrow());
        }else {
            return new MessageResult<Borrow>(false,"系统错误，借阅失败");
        }
    }

    @ResponseBody
    @RequestMapping(value = "rebackBook",method = RequestMethod.POST)
    public MessageResult<Borrow> rebackBook(String borrowId){
        System.out.println(borrowId);
        String[] split = borrowId.split(",");
        List<Integer> borrowIds = new ArrayList();
        for (int i=0;i<split.length;i++){
            borrowIds.add(Integer.parseInt(split[i]));
        }
        System.out.println(borrowId);
        int completeReBack = borrowService.completeReBack(borrowIds);
        if (completeReBack!=0){
            Borrow borrow = new Borrow();
            short a = 1;
            borrow.setIfback(a);
            return new MessageResult<Borrow>(true,borrow);
        }else {
            return new MessageResult<Borrow>(false,"系统错误，归还失败");
        }
    }
}
