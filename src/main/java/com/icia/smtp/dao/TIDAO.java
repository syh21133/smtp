package com.icia.smtp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.CINEMA;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.MOVIE2;
import com.icia.smtp.dto.SEARCHFORTICKET;
import com.icia.smtp.dto.TICKET;

//어노테이션
@Repository
public class TIDAO {

	// [1] sql(mapper)연결
	@Autowired
	private SqlSessionTemplate sql;

	// --------------------------- 티켓 -----------------------------------------

	public int tiCount(SEARCHFORTICKET searchforticket) {

		return sql.selectOne("TICKET.tiCount", searchforticket);
	}

	// 티켓 검색
	public List<MOVIE2> tipList(SEARCHFORTICKET searchforticket) {

		return sql.selectList("TICKET.tipList", searchforticket);
	}

	public List<CINEMA> mvBook() {

		return sql.selectList("Movie.mvbook");
	}

	public List<CINEMA> cnList(String ciRegion) {
		return sql.selectList("TICKET.cnList", ciRegion);
	}

	public int ciNum(CINEMA cinema) {

		return sql.selectOne("TICKET.ciDate", cinema);
	}

	public List<CINEMA> ciRoom(int tcinemaNum) {

		return sql.selectList("TICKET.ciRoom", tcinemaNum);
	}

	// 영화관 지역,이름, 영화이름을 가지고 날짜 검색
	public List<TICKET> tiDate(TICKET ticket) {

		return sql.selectList("TICKET.tiDate", ticket);
	}

	// 영화관 지역,이름을 가지고 날짜 검색
	public List<TICKET> tiDate2(TICKET ticket) {

		return sql.selectList("TICKET.tiDate2", ticket);
	}

	public List<TICKET> ciTime(TICKET ticket) {

		return sql.selectList("TICKET.ciTime", ticket);
	}

	public TICKET tiList(TICKET ticket) {

		return sql.selectOne("TICKET.tiList", ticket);
	}

	public CINEMA ciList(int ticiNum) {

		return sql.selectOne("TICKET.ciList", ticiNum);
	}

	public MOVIE mvList(String ticTitle) {

		return sql.selectOne("TICKET.mvList", ticTitle);
	}

	public List<CINEMA> allregion() {
		return sql.selectList("TICKET.allregion");

	}

	public MOVIE movie(String mvTitle) {

		return sql.selectOne("TICKET.movie", mvTitle);
	}
}
