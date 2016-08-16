package com.jessyon.AccountManage.dao;

import java.util.List;

import com.jessyon.AccountManage.entity.AccountManage;

public interface AccountManageDao {

	public List<AccountManage> findAll();
	public void add(AccountManage account);
	public void deleteById(String Id);
	public void update(AccountManage account);
	
	
}
