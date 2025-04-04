package com.mycom.myapp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myapp.dto.Phone;

@Mapper
public interface PhoneDao {

    public int insertPhone(Phone phone) ;

    public Phone detailPhone(int phoneId);

    public List<Phone> listPhone() ;

    public int updatePhone(Phone phone) ;
    
    public int deletePhone(int phoneId);
}
