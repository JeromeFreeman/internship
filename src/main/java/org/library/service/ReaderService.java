package org.library.service;

import org.library.entity.Reader;
import org.library.entity.ReaderType;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-16.
 */
public interface ReaderService {

    /**
     * 展现读者信息列表
     */
    List<Reader> readers();

    /**
     * 删除读者信息
     * @param id
     * @return
     */
    int delReader(int id);

    /**
     * 添加读者信息
     * @param reader
     * @return
     */
    int addReader(Reader reader);

    /**
     * 修改读者信息
     * @param reader
     * @return
     */
    int updateReader(Reader reader);

    /**
     * 获取身份类型信息
     */
    List<Reader> selectPaperType();

    /**
     * 读者类型查询
     * @return
     */
    List<ReaderType> selectReaderType();

    /**
     * 读者类型
     * @param readerType
     * @return
     */
    int addReaderType(ReaderType readerType);

    /**
     * 读者类型
     * @param id
     * @return
     */
    int delReaderType(int id);

    /**
     * 读者类型
     * @param readerType
     * @return
     */
    int setReaderType(ReaderType readerType);
}
