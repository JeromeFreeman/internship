package org.library.entity;

import java.util.Date;

/**
 * Created by ${Fjq} on 2017-03-15.
 * 读者信息
 */
public class Reader {

    /**
     * 用户编号
     */
    private int id;

    /**
     * 读者姓名
     */
    private String name;

    /**
     * 性别
     */
    private String sex;

    /**
     * 读者条形码
     */
    private String barcode;

    /**
     * 读者职业
     */
    private String vocation;

    /**
     * 读者生日
     */
    private Date birthday;

    /**
     * 验证信息类型
     */
    private String paperType;

    /**
     * 证件号码
     */
    private String paperNo;

    /**
     * 电话
     */
    private String tel;

    /**
     * 邮箱
     */
    private String email;

    /**
     *
     */
    private Date createDate;

    /**
     * 创建时间
     */
    private String operator;

    /**
     * 留言
     */
    private String remark;

    /**
     * 身份类型id
     */
    private int typeid;

    /**
     * 读者身份类型信息
     */
    private ReaderType readerType;

    /**
     * 当前可借书数量
     */
    private int number;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getVocation() {
        return vocation;
    }

    public void setVocation(String vocation) {
        this.vocation = vocation;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPaperType() {
        return paperType;
    }

    public void setPaperType(String paperType) {
        this.paperType = paperType;
    }

    public String getPaperNo() {
        return paperNo;
    }

    public void setPaperNo(String paperNo) {
        this.paperNo = paperNo;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public ReaderType getReaderType() {
        return readerType;
    }

    public void setReaderType(ReaderType readerType) {
        this.readerType = readerType;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", barcode='" + barcode + '\'' +
                ", vocation='" + vocation + '\'' +
                ", birthday=" + birthday +
                ", paperType='" + paperType + '\'' +
                ", paperNo='" + paperNo + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", createDate=" + createDate +
                ", operator='" + operator + '\'' +
                ", remark='" + remark + '\'' +
                ", typeid=" + typeid +
                ", readerType=" + readerType +
                '}';
    }
}
