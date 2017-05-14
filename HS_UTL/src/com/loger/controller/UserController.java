package com.loger.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.loger.dao.HsUsersDao;
import com.loger.dao.UserDao;
import com.loger.entity.HsUsers;
import com.loger.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	ApplicationContext ctx = new ClassPathXmlApplicationContext(
			"applicationContext.xml");
	UserDao dao = ctx.getBean(UserDao.class);
	HsUsersDao hdao = ctx.getBean(HsUsersDao.class);

	@RequestMapping("/list")
	public String list(HttpServletRequest request) {
		List<User> list = dao.findAll();
		request.setAttribute("users", list);
		return "list";
	}

	@RequestMapping("/login")
	public String loginOut() {
		return "login";
	}

	@RequestMapping("/register")
	public String register() {
		return "register";
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

	@RequestMapping("/listById")
	public String listBy(HttpServletRequest request) {
		HsUsers user = hdao.selectByPrimaryKey("1");
		request.setAttribute("user", user);
		return "list";
	}

	@RequestMapping("/loginIn")
	public @ResponseBody String loginIn(String username, String password)
			throws JsonProcessingException {
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		HsUsers userInfo = hdao.login(username, password);
		if(null != userInfo && !"".equals(userInfo.getUsername()))
		{
			map.put("code", "200200");
		}
		else
		{
			map.put("code", "500");
		}
		System.out.println(userInfo.getUsername() +"login in at:");
		return mapper.writeValueAsString(map);
	}
	
	@RequestMapping("/registerIn")
	public @ResponseBody String registerIn(String username, String password)
			throws JsonProcessingException {
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		HsUsers userInfo = new HsUsers();
		userInfo.setUsername(username);
		userInfo.setPassword(password);
		int count = hdao.insertSelective(userInfo);
		if(1 == count)
		{
			map.put("code", "200200");
		}
		else
		{
			map.put("code", "500");
		}
		return mapper.writeValueAsString(map);
	}
	
	@RequestMapping("/matchs")
	public String matchs(HttpServletRequest request) {
		return "matchs";
	}
}