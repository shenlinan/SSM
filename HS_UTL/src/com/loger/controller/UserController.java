package com.loger.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loger.dao.UserDao;
import com.loger.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	ApplicationContext ctx = new ClassPathXmlApplicationContext(
			"applicationContext.xml");
	UserDao dao = ctx.getBean(UserDao.class);

	@RequestMapping("/list")
	public String list(HttpServletRequest request) {
		List<User> list = dao.findAll();
		request.setAttribute("users", list);
		return "list";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		List<User> list = dao.findAll();
		request.setAttribute("users", list);
		return "index";
	}

	@RequestMapping("/add")
	public String add(User user) {
		dao.addUser(user);
		return "success";
	}

	@RequestMapping("/delete")
	public String delete(String id) {
		dao.deleteById(id);
		return "success";
	}

	@RequestMapping("/get")
	public String get(String id, HttpServletRequest request) throws IOException {
		User user = dao.findById(id);
		request.setAttribute("user", user);
		return "show";
	}

	@RequestMapping("/update")
	public String update(User user) {
		dao.updateUser(user);
		return "success";
	}
}