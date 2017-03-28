package org.library.service;

import org.library.entity.Manager;
import org.library.entity.Purview;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 关于管理员的服务
 * 1、登录
 */
public interface ManagerService {

    /**
     * 登录
     */
    Manager login(Manager manager);

    /**
     * 权限管理
     */
    List<Purview> manage();

    /**
     * 管理员删除
     */
    int delete(int id);

    /**
     * 增加管理员
     * 为新增管理员设置权限,插入权限列表（默认为0）
     */
    int addManager(Manager manager);

    /**
     * 设置权限
     */
    int setPurview(Purview purview);

}
