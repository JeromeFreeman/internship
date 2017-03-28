package org.library.web;

import org.library.entity.Manager;
import org.library.entity.Purview;
import org.library.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-15.
 */
@Controller
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    /**
     * 登录处理转发至book请求
     * @param request
     * @param manager
     * @return
     */
    @RequestMapping(value = "login" ,method = RequestMethod.POST)
    public String login(HttpServletRequest request, Manager manager){
        Manager loginManager = managerService.login(manager);
        if (loginManager!=null){
            request.getSession().setAttribute("manager",loginManager);
            return "redirect:rank";
        }else{
            return "login";
        }
    }

    /**
     * 管理员权限查询
     * @param request
     * @return
     */
    @RequestMapping(value = "manage",method = RequestMethod.GET)
    public String manage(HttpServletRequest request){
        List<Purview> purviews = managerService.manage();
        request.getSession().setAttribute("purviews",purviews);
        return "management";
    }

    /**
     * 管理员删除
     * @param id
     * @return
     */
    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id){
        int delete = managerService.delete(id);
        return "redirect:/manage";
    }

    /**
     * 新增管理员
     * 1.加入管理员列表
     * 2.设置权限（默认为0）
     * @param manager
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addManager",method = RequestMethod.POST)
    public String addManager(Manager manager){
        int add = managerService.addManager(manager);
        if (add!=0){
            //return "redirect:manage";
            return "<script type='text/javascript'>window.close()</script>";
        }else {
            //return "management";
            return "addManager";
            //再给点信息去前端
        }

    }

    /**
     * 设置权限，更新权限列表
     * @param purview
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "setPurview",method = RequestMethod.POST)
    public String modifyPurview(Purview purview){
        System.out.println(purview);
        managerService.setPurview(purview);
        return "<script type='text/javascript'>window.close()</script>";
    }



}
