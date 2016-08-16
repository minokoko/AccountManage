package com.jessyon.AccountManage;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jessyon.AccountManage.entity.AccountManage;
import com.jessyon.AccountManage.service.AccountManageService;


@SpringBootApplication
@Controller
public class Application {
	
	@Autowired(required=true)
	private AccountManageService accountManageService;
	
	// freemarker
	@RequestMapping("/hello")
	public String web(Map<String, Object> model) {
		model.put("time", new Date());
		return "hello";// 返回的内容就是templetes下面文件的名称
	}


	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(@RequestBody AccountManage account) {
		accountManageService.update(account);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(@RequestBody AccountManage account) {
		System.out.println(account);
		accountManageService.add(account);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody AccountManage account) {
		accountManageService.deletById(account.getId());
	}

	@RequestMapping("/findAll")
	public String findAll(@ModelAttribute("model") ModelMap model) {
		List<AccountManage> list = accountManageService.findAll();
		model.addAttribute("infos", list);
		model.addAttribute("time", new Date().toLocaleString());
		System.out.println(new Date().toLocaleString());
		return "hello";
	}

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}