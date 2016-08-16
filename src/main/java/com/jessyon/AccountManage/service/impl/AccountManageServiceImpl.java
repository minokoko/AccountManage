package com.jessyon.AccountManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jessyon.AccountManage.dao.AccountManageDao;
import com.jessyon.AccountManage.entity.AccountManage;
import com.jessyon.AccountManage.service.AccountManageService;
@Component
public class AccountManageServiceImpl implements AccountManageService{

	@Autowired(required=true)
	private AccountManageDao accountManageDao;
	
	@Override
	public List<AccountManage> findAll() {
		return accountManageDao.findAll();
	}
	@Override
	public void add(AccountManage account) {
		 accountManageDao.add(account);
	}
	@Override
	public void deletById(String id) {
		accountManageDao.deleteById(id);
		
	}
	@Override
	public void update(AccountManage account) {
		accountManageDao.update(account);
		
	}

}
