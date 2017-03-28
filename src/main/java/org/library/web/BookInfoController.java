package org.library.web;

import org.library.entity.BookInfo;
import org.library.entity.BookType;
import org.library.entity.Bookcase;
import org.library.entity.Publishing;
import org.library.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-15.
 */
@Controller
public class BookInfoController {

    @Autowired
    private BookInfoService bookInfoService;

    @RequestMapping(value = "rank")
    public String bookRank(HttpServletRequest request){
        List<BookInfo> bookList = bookInfoService.bookRank();
        request.getSession().setAttribute("bookList",bookList);
        //System.out.println("***"+bookList);
        return "library";
    }

    /**
     * 书架的增删改查请求
     * @param request
     * @return
     */
    @RequestMapping(value = "cases",method = RequestMethod.GET)
    public String cases(HttpServletRequest request){
        List<Bookcase> bookcases = bookInfoService.cases();
        request.getSession().setAttribute("bookcases",bookcases);
        return "cases";
    }

    @ResponseBody
    @RequestMapping(value = "caseModify",method = RequestMethod.POST)
    public String caseModify(Bookcase bookcase){
        bookInfoService.caseModify(bookcase);
        return "<script type='text/javascript'>window.close()</script>";
    }

    @ResponseBody
    @RequestMapping(value = "addCase",method = RequestMethod.POST)
    public String addCase(Bookcase bookcase){
        bookInfoService.addCase(bookcase);
        return "<script type='text/javascript'>window.close()</script>";
    }

    @RequestMapping(value = "caseDel",method = RequestMethod.GET)
    public String caseDel(HttpServletRequest request,int id){
        int caseDel = bookInfoService.caseDel(id);
        if (caseDel!=0){
            return "redirect:/cases";
        }else{
            //request.getSession().setAttribute("error","此书架有书籍,不能删除!");
            request.setAttribute("error","此书架有书籍,不能删除!");
            return "cases";
        }
    }

    /**
     * 呈现图书增、改表单时的可供选择类型
     */
    @RequestMapping(value = "bookChoose",method = RequestMethod.GET)
    public String bookChoose(HttpServletRequest request, int id){
        List<Bookcase> bookcases = bookInfoService.cases();
        List<BookType> bookTypes = bookInfoService.bookType();
        List<Publishing> publishings = bookInfoService.publishing();
        request.getSession().setAttribute("bookcases",bookcases);
        request.getSession().setAttribute("bookTypes",bookTypes);
        request.getSession().setAttribute("publishings",publishings);
        if (id==0){
            return "addBook";
        }else{
            System.out.println("传过来的id"+id);
            return "redirect:/setBook.jsp?id="+id;
        }
    }

    /**
     * 图书的增删改查请求
     * @param request
     * @return
     */
    @RequestMapping(value = "book",method = RequestMethod.GET)
    public String books(HttpServletRequest request){
        List<BookInfo> books = bookInfoService.books();
        request.getSession().setAttribute("books",books);
        return "book";
    }

    @RequestMapping(value = "setBook",method = RequestMethod.POST)
    public String setBook(BookInfo bookInfo){
        int i = bookInfoService.setBook(bookInfo);
        return "redirect:/book";
    }

    @RequestMapping(value = "addBook",method = RequestMethod.POST)
    public String addBook(BookInfo bookInfo){
        int i = bookInfoService.addBook(bookInfo);
        return "redirect:/book";
    }

    @RequestMapping(value = "delBook",method = RequestMethod.GET)
    public String delBook(HttpServletRequest request,int id){
        int i = bookInfoService.delBook(id);
        return "redirect:/book";
    }

    /**
     * 图书类型查询
     */
    @RequestMapping(value = "bookType",method = RequestMethod.GET)
    public String bookType(HttpServletRequest request){
        List<BookType> bookTypes = bookInfoService.bookType();
        request.getSession().setAttribute("bookTypes",bookTypes);
        return "bookType";
    }

    @ResponseBody
    @RequestMapping(value = "addBookType",method = RequestMethod.POST)
    public String addBookType(BookType bookType){
        bookInfoService.addBookType(bookType);
        return "<script type='text/javascript'>window.close()</script>";
    }

    @ResponseBody
    @RequestMapping(value = "setBookType",method = RequestMethod.POST)
    public String setBookType(BookType bookType){
        bookInfoService.setBookType(bookType);
        return "<script type='text/javascript'>window.close()</script>";
    }

    @RequestMapping(value = "delBookType",method = RequestMethod.GET)
    public String delBookType(HttpServletRequest request,int id){
        int delBookType = bookInfoService.delBookType(id);
        return "redirect:/bookType";
    }


}
