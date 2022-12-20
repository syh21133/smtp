package com.icia.smtp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.REVIEW;

@Repository
public class RVDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// MOV011 : 리뷰 불러오기
	public List<REVIEW> rvList(String rvTitle) {

		return sql.selectList("Review.rvList", rvTitle);
	}

	// MOV012 : 리뷰 작성하기
	public int rvWrite(REVIEW review) {

		return sql.insert("Review.rvWrite", review);
	}

	// MOV011 : 리뷰 갯수 불러오기
	public int rvCnt(String rvTitle) {
		return sql.selectOne("Review.rvCount", rvTitle);
	}

	// MOV013 : 리뷰 삭제하기
	public int rvDelete(REVIEW review) {
		return sql.delete("Review.rvDelete", review);
	}

}
