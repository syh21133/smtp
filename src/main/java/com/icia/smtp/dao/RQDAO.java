package com.icia.smtp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.REPQUE;

@Repository
public class RQDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 자주찾는질문 상세보기
	public REPQUE rqView(int rqNum) {

		
		return sql.selectOne("Repque.rqView", rqNum);
	}
	// 자주찾는질문 조회수 증가
	public int rqHit(int rqNum) {
		
		return sql.update("Repque.rqHit", rqNum);
		
	}

	// 자주찾는질문 삭제
	public int rqDelete(int rqNum) {
		return sql.delete("Repque.rqDelete", rqNum);
	}

	// 자주찾는질문 작성
	public int rqWrite(REPQUE repque) {
		return sql.insert("Repque.rqWrite", repque);
	}

	

}
