package com.icia.smtp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.ALL;
import com.icia.smtp.dto.USERS;

@Repository
public class MemDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int memJoin(USERS user) {

		return sql.insert("USERS.memJoin", user);
	}

	public String checkId(String userId) {

		return sql.selectOne("USERS.checkId", userId);
	}

	public USERS memberLogin(USERS user) {

		return sql.selectOne("USERS.memberLogin", user);
	}

	public USERS memberMyView(String userId) {

		return sql.selectOne("USERS.memberMyView", userId);
	}

	public int memDel(String userId) {

		return sql.delete("USERS.memDel", userId);
	}

	public int memberModifyProcess(USERS user) {

		return sql.update("USERS.memModi", user);
	}

	public List<ALL> bookList(ALL all) {

		return sql.selectList("USERS.bookList", all);
	}

	public int mybookCount(String userId) {

		return sql.selectOne("USERS.mybookCount", userId);
	}

}
