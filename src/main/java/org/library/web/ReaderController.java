package org.library.web;

import org.library.entity.Manager;
import org.library.entity.Reader;
import org.library.entity.ReaderType;
import org.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-16.
 */
@Controller
public class ReaderController {

    @Autowired
    private ReaderService readerService;

    /**
     * 读者
     * @param request
     * @return
     */
    @RequestMapping(value = "readers",method = RequestMethod.GET)
    public String readers(HttpServletRequest request){
        List<Reader> readers = readerService.readers();
        request.getSession().setAttribute("readers",readers);
        return "reader";
    }

    @RequestMapping(value = "selectType",method = RequestMethod.GET)
    public String type(HttpServletRequest request,Model model,int id){
        List<Reader> readerList = readerService.selectPaperType();
        List<ReaderType> readerTypeList = readerService.selectReaderType();
//        model.addAttribute("readerList",readerList);
//        model.addAttribute("readerTypeList",readerTypeList);
        request.getSession().setAttribute("readerList",readerList);
        request.getSession().setAttribute("readerTypeList",readerTypeList);
        if (id==0){
            return "addReader";
        }else{
            System.out.println("传过来的id"+id);
            return "redirect:/updateReader.jsp?id="+id;
        }

    }

    @RequestMapping(value = "addReader",method = RequestMethod.POST)
    public String addReader(HttpServletRequest request,Reader reader){
        reader.setCreateDate(new Date());
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        reader.setOperator(manager.getName());
        System.out.println(reader);
        int addReader = readerService.addReader(reader);
        return "redirect:/readers";
    }

    @RequestMapping(value = "updateReader",method = RequestMethod.POST)
    public String updateReader(HttpServletRequest request,Reader reader){
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        reader.setOperator(manager.getName());
        System.out.println(reader);
        int updateReader = readerService.updateReader(reader);
        return "redirect:/readers";
    }

    @RequestMapping(value = "delReader",method = RequestMethod.GET)
    public String delReader(HttpServletRequest request,int id){
        int delReader = readerService.delReader(id);
        return "redirect:/readers";
    }


    /**
     * 读者类型
     */
    @RequestMapping(value = "readerType",method = RequestMethod.GET)
    public String readerType(HttpServletRequest request){
        List<ReaderType> readerTypes = readerService.selectReaderType();
        request.getSession().setAttribute("readerTypes",readerTypes);
        return "readerType";
    }

    @ResponseBody
    @RequestMapping(value = "addReaderType",method = RequestMethod.POST)
    public String addReaderType(HttpServletRequest request,ReaderType readerType){
        int addReaderType = readerService.addReaderType(readerType);
        System.out.println(addReaderType+"   "+readerType);
        return "<script type='text/javascript'>window.close()</script>";
    }

    @ResponseBody
    @RequestMapping(value = "setReaderType",method = RequestMethod.POST)
    public String setReaderType(HttpServletRequest request,ReaderType readerType){
        int setReaderType = readerService.setReaderType(readerType);
        System.out.println(setReaderType+"     "+readerType);
        return "<script type='text/javascript'>window.close()</script>";
    }

    @RequestMapping(value = "delReaderType",method = RequestMethod.GET)
    public String delReaderType(HttpServletRequest request,int id){
        int delReaderType = readerService.delReaderType(id);
        return "redirect:/readerType";
    }
}
