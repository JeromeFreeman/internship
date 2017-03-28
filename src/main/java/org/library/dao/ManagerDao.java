package org.library.dao;

import org.library.entity.Manager;
import org.library.entity.Purview;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-15.
 */
public interface ManagerDao {

    /**
     * 登录
     */
    Manager login(Manager manager);

    /**
     * 权限管理查询
     */
    List<Purview> manage();

    /**
     * 管理员删除
     */
    int delete(int id);

    /**
     * 增加管理员
     */
    int addManager(Manager manager);

    /**
     * 查询新增管理员的id,,,语句与查询一样
     */
    Manager addBack(Manager manager);

    /**
     * 为新增管理员设置权限,插入权限列表（默认为0）
     */
    int addPurview(int id);

    /**
     * 设置权限
     */
    int setPurview(Purview purview);



}
