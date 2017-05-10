package com.loger.dao;

import java.util.List;

import com.loger.annotation.MyBatisRepository;
import com.loger.entity.User;

@MyBatisRepository
public interface UserDao {
	List<User> findAll();

	User findById(String id);

	void deleteById(String id);

	void addUser(User user);

	void updateUser(User user);
}