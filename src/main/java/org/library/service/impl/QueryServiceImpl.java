package org.library.service.impl;

import org.library.dao.QueryDao;
import org.library.entity.BookInfo;
import org.library.entity.Borrow;
import org.library.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-20.
 */
@Service
public class QueryServiceImpl implements QueryService {

    @Autowired
    private QueryDao queryDao;

    public List<Borrow> queryBorrow(Borrow borrow) {
        return queryDao.queryBorrow(borrow);
    }

    public List<Borrow> queryOut() {
        return queryDao.queryOut();
    }

    public List<BookInfo> queryBook(BookInfo bookInfo) {
        return queryDao.queryBook(bookInfo);
    }
}
