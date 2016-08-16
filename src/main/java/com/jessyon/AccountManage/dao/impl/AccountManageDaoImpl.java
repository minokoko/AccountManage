package com.jessyon.AccountManage.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.jessyon.AccountManage.dao.AccountManageDao;
import com.jessyon.AccountManage.entity.AccountManage;
@Component
@Repository
public class AccountManageDaoImpl implements AccountManageDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<AccountManage> findAll() {
		String sql = "select * from info";
		return (List<AccountManage>) jdbcTemplate.query(sql, new RowMapper<AccountManage>() {

			public AccountManage mapRow(ResultSet rs, int rowNum) throws SQLException {
				AccountManage accountManage = new AccountManage();
				accountManage.setCountType(rs.getString("count_type"));
				accountManage.setCreateTime(rs.getString("create_time"));
				accountManage.setId(rs.getString("id"));
				accountManage.setLastTime(rs.getString("last_time"));
				accountManage.setName(rs.getString("name"));
				accountManage.setStatus(rs.getString("status"));
				accountManage.setRemark(rs.getString("remark"));
				System.out.println(accountManage.toString());
				return accountManage;
			}
		});
	}

	public void add(AccountManage account) {
		jdbcTemplate.update(
				"insert into info(id,name,create_time,status,count_type,last_time,remark ) values(?,?,?,?,?,?,?)",
				account.getId(), account.getName(), account.getCreateTime(), account.getStatus(),
				account.getCountType(), account.getLastTime(), account.getRemark());
	}

	public void deleteById(String id) {
		jdbcTemplate.update("delete from info where id = ?", id);
	}

	@Override
	public void update(AccountManage account) {
		jdbcTemplate.update(
				"update  info(name,create_time,status,count_type,last_time,remark ) values(?,?,?,?,?,?) where id=?",
				 account.getName(), account.getCreateTime(), account.getStatus(),
				account.getCountType(), account.getLastTime(), account.getRemark(),account.getId());
	}
}
