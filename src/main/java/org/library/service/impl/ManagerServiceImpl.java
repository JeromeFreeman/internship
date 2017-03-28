package org.library.service.impl;

import org.library.dao.ManagerDao;
import org.library.entity.Manager;
import org.library.entity.Purview;
import org.library.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-15.
 */
@Service
public class ManagerServiceImpl implements ManagerService{

    @Autowired
    private ManagerDao managerDao;

    public Manager login(Manager manager) {
        return managerDao.login(manager);
    }

    public List<Purview> manage() {
        return managerDao.manage();
    }

    public int delete(int id) {
        return managerDao.delete(id);
    }

    /**
     * <p>增加管理员</p>
     * <p>为新增管理员设置权限,插入权限列表（默认为0）,插入语句设置</p>
     * @param manager
     * @return
     */
    @Transactional
    public int addManager(Manager manager) {
        int addManager = managerDao.addManager(manager);
        if (addManager!=0){
            Manager newManager = managerDao.login(manager);
            System.out.println("新增管理员的id:"+newManager.getId());
            int addPurview = managerDao.addPurview(newManager.getId());
            return addPurview;
        }else {
            return 0;
        }
    }

    /**
     * 设置权限，更新权限列表
     * @param purview
     * @return
     */
    public int setPurview(Purview purview) {
        return managerDao.setPurview(purview);
    }
}
