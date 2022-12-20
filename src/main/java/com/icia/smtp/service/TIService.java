package com.icia.smtp.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.TIDAO;
import com.icia.smtp.dto.CINEMA;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.MOVIE2;
import com.icia.smtp.dto.SEARCHFORTICKET;
import com.icia.smtp.dto.TICKET;

@Service
public class TIService {

	// [1]ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// [2]DAO 연결(Repository)
	@Autowired
	private TIDAO tidao;

	@Autowired
	private HttpServletRequest request;

	// --------------------------- 티켓 -----------------------------------------

	// 티켓 리스트 가져오기 (검색, 페이지, 필터, 페이지당 개수)
	public ModelAndView tipList(String ciRegion, String ticDate, String ciName, String methodForSort, String[] mvGenre,
			String keyword, int page, int limit, int methodarray) {
		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		String mvGenrelist = "";
		String formvGenre = "";
		for (int i = 0; i < mvGenre.length; i++) {
			if (i < mvGenre.length - 1) {
				mvGenrelist += mvGenre[i] + "','";
				formvGenre += "genre=" + mvGenre[i] + "&";
			} else {
				mvGenrelist += mvGenre[i];
				formvGenre += "genre=" + mvGenre[i];
			}
		}

		String savemethodForSort = methodForSort;
		// 제목으로 정렬
		if (methodForSort.equals("sort_title")) {
			methodForSort = " ORDER BY m.mvTitle ASC";
		}
		// 조회순으로 정렬
		else if (methodForSort.equals("sort_view")) {
			methodForSort = " ORDER BY m.MVATTENDENCE DESC";
		}
		// 관람등급으로 정렬
		else if (methodForSort.equals("sort_mvgrade")) {
			methodForSort = " ORDER BY m.MVGRADE ASC";
		}
		// 개봉일 순으로 정렬
		else {// sort_date
			methodForSort = " ORDER BY m.MVDATE DESC";
		}
		SEARCHFORTICKET searchforticket = new SEARCHFORTICKET(ciRegion, ticDate, ciName, methodForSort, keyword, page,
				limit, mvGenrelist, formvGenre, methodarray);
		// 전체 게시글 갯수를 DB에서 가져온다.

		int tiCount = 0;

		// where를 전부 집어넣는다.
		String where = "";
		// 지역 선택시
		if (!ciRegion.equals("all")) {
			where += " AND ciRegion='" + ciRegion + "'";
		}
		// 영화관 선택시
		if (!ciName.equals("all")) {
			where += " AND ciName='" + ciName + "'";
		}
		// 장르 선택시
		if (mvGenre.length >= 1) {
			for (int i = 0; i < mvGenre.length; i++) {
				where += " AND mvGenre Like '%" + mvGenre[i] + "%'";
			}
		}
		// 날짜 선택시
		if (!ticDate.equals("all")) {
			where += " AND ticDate='" + ticDate + "'";
		}
		where += " AND mvTitle Like '%" + keyword + "%'";

		// searchforticket에 where를 넣는다.
		searchforticket.setWhere(where);
		// 개수 구하기
		tiCount = tidao.tiCount(searchforticket);
		
		searchforticket.setTiCount(tiCount);

		
		// ----------여기부터는 tiCount를 사용합니다.---------
		// 최대 게시글 갯수
		int maxPage = (int) (Math.ceil((double) tiCount / limit));
		if (maxPage < 1) {
			maxPage = 1;
		}
		// page 검사
		if (page > maxPage) {
			page = maxPage;
		}
		// ----------여기부터는 page변수를 사용합니다.---------

		// 표시될 게시글 묶음
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		// 표시될 페이지 묶음
		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;
		int endPage = startPage + block - 1;

		// endPage 검사
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		// ----------여기부터는 startRow, endRow, startPage, endPage를 사용합니다.---------

		// 페이징 객체 생성
		searchforticket.setPage(page);
		searchforticket.setStartRow(startRow);
		searchforticket.setEndRow(endRow);
		searchforticket.setMaxPage(maxPage);
		searchforticket.setStartPage(startPage);
		searchforticket.setEndPage(endPage);
		searchforticket.setLimit(limit);

		List<MOVIE2> pagingList;

		pagingList = tidao.tipList(searchforticket);

		for (int i = 0; i < pagingList.size(); i++) {
			int time = pagingList.get(i).getMvTime();
			pagingList.get(i).setHour(time / 60);
			pagingList.get(i).setMinutes(time - (time / 60) * 60);
		}

		List<CINEMA> region = tidao.allregion();

		searchforticket.setMethodForSort(savemethodForSort);
		// MODEL
		mav.addObject("pagingList", pagingList);
		mav.addObject("searchforticket", searchforticket);
		mav.addObject("region", region);
		// VIEW
		mav.setViewName("BookMain");
		return mav;
	}

	public ModelAndView mvBook(String mvTitle) {

		MOVIE movie = tidao.movie(mvTitle);
		List<CINEMA> mvList = tidao.mvBook();

		mav.addObject("movie", movie);
		mav.addObject("mvList", mvList);
		mav.setViewName("mvBook");

		return mav;
	}

	public List<CINEMA> ciRegion(String ciRegion) {

		List<CINEMA> cnList = tidao.cnList(ciRegion);

		return cnList;
	}

	// 영화관 지역,이름, 영화이름을 가지고 날짜 검색
	public List<TICKET> ciDate(String ciName, String ciRegion, String mvTitle) {
		CINEMA cinema = new CINEMA();
		cinema.setCiName(ciName);
		cinema.setCiRegion(ciRegion);
		int tcinemaNum = tidao.ciNum(cinema);
		TICKET ticket = new TICKET();
		ticket.setTcinemaNum(tcinemaNum);
		ticket.setTicTitle(mvTitle);
		List<TICKET> ciDateList = tidao.tiDate(ticket);
		return ciDateList;
	}

	// 영화관 지역,이름을 가지고 날짜 검색
	public List<TICKET> ciDate2(String ciName, String ciRegion) {
		CINEMA cinema = new CINEMA();
		cinema.setCiName(ciName);
		cinema.setCiRegion(ciRegion);
		int tcinemaNum = tidao.ciNum(cinema);
		TICKET ticket = new TICKET();
		ticket.setTcinemaNum(tcinemaNum);
		List<TICKET> ciDateList = tidao.tiDate2(ticket);
		return ciDateList;
	}

	public List<CINEMA> ciRoom(int tcinemaNum) {

		List<CINEMA> ciRoomList = tidao.ciRoom(tcinemaNum);

		return ciRoomList;

	}

	public List<TICKET> ciTime(String ciRoom, int ciNum, Date ticDate, String ticTitle) {

		TICKET ticket = new TICKET();

		ticket.setTiciNum(ciNum);
		ticket.setTicDate(ticDate);
		ticket.setTicTitle(ticTitle);

		List<TICKET> ciTimeList = tidao.ciTime(ticket);

		return ciTimeList;
	}

	public ModelAndView ticketBook(TICKET ticket) {

		TICKET tiList = tidao.tiList(ticket);

		mav.addObject("tiList", tiList);

		CINEMA ciList = tidao.ciList(tiList.getTiciNum());

		mav.addObject("ciList", ciList);

		MOVIE mvList = tidao.mvList(tiList.getTicTitle());

		mav.addObject("mvList", mvList);
		mav.setViewName("ticketCheck");

		return mav;
	}

}
