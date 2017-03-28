package org.library.dao;

import org.library.entity.Reader;
import org.library.entity.ReaderType;

import java.util.List;

/**
 * Created by ${Fjq} on 2017-03-16.
 * 读者增删改查
 * 读者类型增删改查
 */
public interface ReaderDao {

    /**
     * 读者
     */
    List<Reader> readers();

    int addReader(Reader reader);

    int delReader(int id);

    int updateReader(Reader reader);

    /**
     * 修改、新增表单中的身份类型选择
     */
    List<Reader> paperTypes();

    List<ReaderType> readerTypes();


    /**
     * 读者类型
     */
    //List<ReaderType> readerTypes();

    int addReaderType(ReaderType readerType);

    int delReaderType(int id);

    int setReaderType(ReaderType readerType);


}
