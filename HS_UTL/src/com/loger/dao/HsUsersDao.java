package com.loger.dao;

import com.loger.annotation.MyBatisRepository;
import com.loger.entity.HsUsers;

@MyBatisRepository
public interface HsUsersDao {
	int deleteByPrimaryKey(String userid);

	int insert(HsUsers record);

	int insertSelective(HsUsers record);

	HsUsers selectByPrimaryKey(String userid);
	
	HsUsers login(String username,String password);

	int updateByPrimaryKeySelective(HsUsers record);

	int updateByPrimaryKey(HsUsers record);
}