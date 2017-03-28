package org.library.service.impl;

import org.library.dao.ReaderDao;
import org.library.entity.Reader;
import org.library.entity.ReaderType;
import org.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-16.
 */
@Service
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    private ReaderDao readerDao;

    /**
     * 展现读者信息列表
     * @return
     */
    public List<Reader> readers() {
        return readerDao.readers();
    }

    /**
     * 删除读者信息
     * @param id
     * @return
     */
    public int delReader(int id) {
        return readerDao.delReader(id);
    }

    /**
     * 添加读者信息
     * 提交表达时，插入信息
     * @param reader
     * @return
     */
    public int addReader(Reader reader) {
        return readerDao.addReader(reader);
    }

    /**
     * 修改读者信息
     * 提交表达时，按id更新信息
     * @param reader
     * @return
     */
    public int updateReader(Reader reader) {
        return readerDao.updateReader(reader);
    }

    /**
     * 实现获取下列信息
     * 1、先查询读者身份证件类型
     * 2、在查询读者身份类型
     * @return
     */
    public List<Reader> selectPaperType() {
        List<Reader> readerList = readerDao.paperTypes();
        return readerList;
    }

    /**
     * 读者类型的增删改
     * @return
     */
    public List<ReaderType> selectReaderType() {
        List<ReaderType> readerTypeList = readerDao.readerTypes();
        return readerTypeList;
    }

    public int addReaderType(ReaderType readerType) {
        return readerDao.addReaderType(readerType);
    }

    public int delReaderType(int id) {
        return readerDao.delReaderType(id);
    }

    public int setReaderType(ReaderType readerType) {
        return readerDao.setReaderType(readerType);
    }
}
