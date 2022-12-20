package com.icia.smtp.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.MVDAO;
import com.icia.smtp.dao.RVDAO;
import com.icia.smtp.dto.ACTOR;
import com.icia.smtp.dto.ALL;
import com.icia.smtp.dto.CASTS;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.MOVIEPOSTER;
import com.icia.smtp.dto.MOVIETEASER;

@Service
public class MVService {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private MVDAO mvdao;

	@Autowired
	private HttpServletRequest request;

	// MOV010 : 영화 정보 상세보기
	public ModelAndView mvView(String mvTitle) {

		MOVIE movie = mvdao.mvView(mvTitle);

		List<CASTS> casts = mvdao.caView(mvTitle);

		List<ACTOR> actorList = new ArrayList<>();

		for (int i = 0; i < casts.size(); i++) {
			ACTOR actor = mvdao.acView(casts.get(i).getCacNum());

			actorList.add(i, actor);

		}

		List<MOVIEPOSTER> mvPoster = mvdao.poView(mvTitle);
		List<MOVIETEASER> mvTeaser = mvdao.teaView(mvTitle);

		mav.addObject("movie", movie);
		mav.addObject("actorList", actorList);
		mav.addObject("mvPoster", mvPoster);
		mav.addObject("mvTeaser", mvTeaser);

		mav.setViewName("MV_View");

		return mav;
	}

	public ModelAndView mvList(int page, int limit) {

		ALL all = new ALL();

		int block = 5;
		int bCount = mvdao.mvCount();
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		int maxPage = (int) (Math.ceil((double) bCount / limit));
		int startPage = ((int) (Math.ceil((double) page / block)) - 1) * block + 1;
		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		all.setPage(page);
		all.setStartRow(startRow);
		all.setEndRow(endRow);
		all.setMaxPage(maxPage);
		all.setStartPage(startPage);
		all.setEndPage(endPage);
		all.setLimit(limit);

		List<MOVIE> mvList = mvdao.mvList(all);

		mav.addObject("paging", all);
		mav.addObject("mvList", mvList);
		mav.setViewName("movieList");

		return mav;
	}

}