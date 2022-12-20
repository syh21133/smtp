package com.icia.smtp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.MOVIE2;
import com.icia.smtp.dto.NOTICE;
import com.icia.smtp.dto.QUEST;
import com.icia.smtp.dto.REPQUE;
import com.icia.smtp.dto.SEARCHFORTICKET;

//어노테이션
@Repository
public class MainDAO {

	// [1] sql(mapper)연결
	@Autowired
	private SqlSessionTemplate sql;

	public List<MOVIE2> tipList8(SEARCHFORTICKET searchforticket) {

		return sql.selectList("TICKET.tipList8", searchforticket);
	}

	public List<MOVIE2> P_indexalltop5() {
		// dao에서 인기작 top5 가져오기
		return sql.selectList("MAIN.alltopfive");
	}

	public List<MOVIE> atList() {

		return sql.selectList("MAIN.atList");
	}

	public List<MOVIE> dateList() {

		return sql.selectList("MAIN.dateList");
	}

	public List<QUEST> quList(String userId) {

		return sql.selectList("MAIN.quList", userId);
	}

	public List<NOTICE> notiList() {

		return sql.selectList("MAIN.notiList");
	}

	public List<REPQUE> rqList() {

		return sql.selectList("MAIN.rqList");
	}

	public List<QUEST> adquList() {

		return sql.selectList("MAIN.adquList");
	}

}
