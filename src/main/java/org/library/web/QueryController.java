package org.library.web;

import org.library.entity.*;
import org.library.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-20.
 */
@Controller
public class QueryController {

    @Autowired
    private QueryService queryService;

    @RequestMapping(value = "queryBorrow",method = RequestMethod.POST)
    public String queryBorrow(Borrow borrow, HttpServletRequest request){

        int queryType = borrow.getQueryType();
        String queryCont = borrow.getQueryCont();
        switch (queryType){
            case 1:
                borrow.setBookInfo(new BookInfo());
                borrow.getBookInfo().setBarcode(queryCont);
                break;
            case 2:
                borrow.setBookInfo(new BookInfo());
                borrow.getBookInfo().setBookname(queryCont);
                break;
            case 3:
                borrow.setReader(new Reader());
                borrow.getReader().setBarcode(queryCont);
                break;
            case 4:
                borrow.setReader(new Reader());
                borrow.getReader().setName(queryCont);
                break;
        }
        String begin = borrow.getBegin();
        String end = borrow.getEnd();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (begin!=""&&end!=""){
            try {
                Date borrowTime = sdf.parse(begin);
                Date backTime = sdf.parse(end);
                borrow.setBorrowTime(borrowTime);
                borrow.setBackTime(backTime);
            }catch (Exception e){
                System.out.println("日期格式错误！");
            }
        }
        System.out.println(borrow);
        List<Borrow> borrows = queryService.queryBorrow(borrow);
        if(borrows!=null && borrows.size() != 0){
            request.setAttribute("borrows",borrows);
        }else{
            request.setAttribute("error","没有查找到图书信息");
        }
        return "queryBorrow";
    }

    @RequestMapping(value = "queryBook",method = RequestMethod.POST)
    public String queryBook(BookInfo bookInfo, HttpServletRequest request){
        int queryType = bookInfo.getQueryType();
        String queryCont = bookInfo.getQueryCont();
        //1==条形码，2==类别，3==书名，4==作者，5==出版社，6==书架
        switch (queryType){
            case 1:
                bookInfo.setBarcode(queryCont);
                break;
            case 2:
                bookInfo.setBookType(new BookType());
                bookInfo.getBookType().setTypename(queryCont);
                break;
            case 3:
                bookInfo.setBookname(queryCont);
                break;
            case 4:
                bookInfo.setAuthor(queryCont);
                break;
            case 5:
                bookInfo.setPublishing(new Publishing());
                bookInfo.getPublishing().setPubname(queryCont);
                break;
            case 6:
                bookInfo.setBookcase(new Bookcase());
                bookInfo.getBookcase().setName(queryCont);
                break;
        }
        System.out.println(bookInfo);
        List<BookInfo> bookInfos = queryService.queryBook(bookInfo);
        if(bookInfos!=null && bookInfos.size()!=0){
            request.setAttribute("bookInfos",bookInfos);
        }else{
            request.setAttribute("error","没有查找到图书信息");
        }
        return "queryBook";
    }

    @RequestMapping(value = "queryOut",method = RequestMethod.GET)
    public String queryOut(Model model, HttpServletRequest request) {
        List<Borrow> borrows = queryService.queryOut();
        model.addAttribute("borrows",borrows);
        return "queryOut";
    }
}
