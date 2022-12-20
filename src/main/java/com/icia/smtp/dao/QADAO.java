package com.icia.smtp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.NOTICE;
import com.icia.smtp.dto.PAGE;
import com.icia.smtp.dto.QUEST;
import com.icia.smtp.dto.REPQUE;
import com.icia.smtp.dto.WHERE;

//어노테이션
@Repository
public class QADAO {

	// [1] sql(mapper)연결
	@Autowired
	private SqlSessionTemplate sql;

	// --------------------------- 티켓 -----------------------------------------

	public List<NOTICE> qanotice5() {
		return sql.selectList("QUEST.qanotice5");
	}

	public List<QUEST> qaquest5(String userId) {
		return sql.selectList("QUEST.qaquest5", userId);
	}

	public List<REPQUE> repque5() {
		return sql.selectList("QUEST.qarepque5");
	}

	// ---------------------페이징 처리-----------------------------------------------

	// 공지사항 개수
	public int qanoticeCount(WHERE where) {

		return sql.selectOne("QUEST.qanoticeCount", where);
	}

	// 공지사항 페이징
	public List<NOTICE> qanoticeall(PAGE paging) {
		return sql.selectList("QUEST.qanoticeall", paging);
	}

	// 자주찾는질문 개수
	public int qarepqueCount(WHERE where2) {
		return sql.selectOne("QUEST.qarepqueCount", where2);
	}

	// 자주찾는질문 페이징
	public List<REPQUE> qarepqueall(PAGE paging) {
		return sql.selectList("QUEST.qarepqueall", paging);
	}

	// 문의내역 개수
	public int qaquestCount(WHERE where) {
		return sql.selectOne("QUEST.qaquestCount", where);
	}

	// 문의내역 페이징
	public List<QUEST> qaquestall(PAGE paging) {
		return sql.selectList("QUEST.qaquestall", paging);
	}

	// 문의내역 상세보기
	public QUEST quView(int quNum) {
		sql.update("QUEST.quHit", quNum);
		return sql.selectOne("QUEST.quView", quNum);
	}

	// 내 문의내역 삭제
	public int rqDelete(int quNum) {
		return sql.delete("QUEST.quDelete", quNum);
	}

	public int adquestCount(WHERE where2) {
		// TODO Auto-generated method stub
		return sql.selectOne("QUEST.adquestCount", where2);
	}

	public List<QUEST> adquestall(PAGE paging) {

		return sql.selectList("QUEST.adquestall", paging);
	}

	// 문의사항 답변(관리자)
	public int quAnswerWrite(QUEST quest) {
		return sql.update("QUEST.quAnswerWrite", quest);
	}

	// 문의내역 작성하기
	public int quWrite(QUEST quest) {
		return sql.insert("QUEST.quWrite", quest);
	}

}
