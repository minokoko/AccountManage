package com.jessyon.AccountManage.service;

import java.util.List;

import com.jessyon.AccountManage.entity.AccountManage;

public interface AccountManageService {

	public List<AccountManage> findAll();
	public void add(AccountManage account);
	public void deletById(String id);
	public void update(AccountManage account);
	
}
