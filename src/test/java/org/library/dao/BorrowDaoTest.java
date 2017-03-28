package org.library.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.library.entity.Borrow;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;


/**
 * 配置spring和junit整合
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class BorrowDaoTest {

    //注入Dao实现类依赖
    @Resource
    private BorrowDao borrowDao;

    @Test
    public void backRenew() throws Exception {
        List<Integer> borrowId = new ArrayList();
        borrowId.add(2);
        borrowId.add(3);
        System.out.println(borrowId);
        List<Borrow> borrow = borrowDao.backRenew(borrowId);
        for (Borrow b:borrow) {
            System.out.println(borrow);
        }
        /**
         *   Preparing: SELECT * FROM library.tb_borrow WHERE id IN ( ? , ? )
             ==> Parameters: 2(Integer), 3(Integer)
         15:28:18.953 [main] DEBUG org.library.dao.BorrowDao.backRenew - <==      Total: 2
         */
    }

    @Test
    public void renewBook() throws Exception {
        List<Borrow> borrows = borrowDao.renewBook(1, null);
        System.out.println(borrows);
    }

}