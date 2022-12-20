package com.icia.smtp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.NOTICE;

@Repository
public class NOTIDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 공지사항 상세보기
	public NOTICE notiView(int notiNum) {

		return sql.selectOne("Notice.notiView", notiNum);
	}

	// 공지사항 삭제
	public int notiDelete(int notiNum) {

		return sql.delete("Notice.notiDelete", notiNum);
	}

	// 공지 작성하기
	public int notiWrite(NOTICE notice) {
		return sql.insert("Notice.notiWrite", notice);
	}

}
