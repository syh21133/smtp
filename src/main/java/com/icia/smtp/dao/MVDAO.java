package com.icia.smtp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.ACTOR;
import com.icia.smtp.dto.ALL;
import com.icia.smtp.dto.CASTS;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.MOVIEPOSTER;
import com.icia.smtp.dto.MOVIETEASER;

@Repository
public class MVDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// MOV004 : 영화 추가
	public int mvAdd(MOVIE movie, ACTOR actor) {

		int result1 = sql.insert("Actor.actAdd", actor);
		int result2 = sql.insert("Movie.mvAdd", movie);
		int result3 = 0;

		if ((result1 & result2) == 1) {
			result3 = 1;
		}

		return result3;
	}

	// MOV010 : 영화 정보 상세보기
	public MOVIE mvView(String mvTitle) {

		return sql.selectOne("Movie.mvView", mvTitle);
	}

	// MOV010 : 영화 정보 상세보기(출연자 정보 service로 가져가서 배우 정보 가져올거임)
	public List<CASTS> caView(String mvTitle) {

		return sql.selectList("Casts.caView", mvTitle);
	}

	// MOV010 : 영화 정보 상세보기(배우 정보)
	public ACTOR acView(int acNum) {

		return sql.selectOne("Actor.acView", acNum);
	}

	// MOV010 : 영화 정보 상세보기(포스터 정보)
	public List<MOVIEPOSTER> poView(String mvTitle) {

		return sql.selectList("MoviePoster.poView", mvTitle);
	}

	// MOV010 : 영화 정보 상세보기(예고편 정보)
	public List<MOVIETEASER> teaView(String mvTitle) {

		return sql.selectList("MovieTeaser.teaView", mvTitle);
	}

	public List<MOVIE> mvList(ALL all) {

		return sql.selectList("Movie.mvList", all);
	}

	public int mvCount() {

		return sql.selectOne("Movie.mvCount");
	}

}
