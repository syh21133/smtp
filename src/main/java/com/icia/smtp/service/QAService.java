package com.icia.smtp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.QADAO;
import com.icia.smtp.dto.NOTICE;
import com.icia.smtp.dto.PAGE;
import com.icia.smtp.dto.QUEST;
import com.icia.smtp.dto.REPQUE;
import com.icia.smtp.dto.WHERE;

@Service
public class QAService {

	// [1]ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// [2]DAO 연결(Repository)
	@Autowired
	private QADAO qadao;

	@Autowired
	private HttpServletRequest request;

	private WHERE where2 = new WHERE();
	// --------------------------- 티켓 -----------------------------------------

	// 티켓 리스트 가져오기 (검색, 페이지, 필터, 페이지당 개수)
	public ModelAndView qapList(String userId) {

		// 최신 공지사항을 5개 가져온다.
		List<NOTICE> notice5 = qadao.qanotice5();

		// 조회순으로 자주찾는질문을 5개 가져온다.
		List<REPQUE> repque5 = qadao.repque5();

		// 내 문의내역을 최신순으로 10개 가져온다.
		List<QUEST> quest5 = qadao.qaquest5(userId);

		// MODEL
		mav.addObject("quList", quest5);
		mav.addObject("rqList", repque5);
		mav.addObject("notiList", notice5);
		mav.addObject("userId", userId);

		// VIEW
		mav.setViewName("CS");
		return mav;
	}

	// 공지사항 페이징+검색
	public ModelAndView qanoticepList(int page, int limit, String category, String keyword) {

		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 전체 게시글 갯수를 DB에서 가져온다.
		String where = "";

		if (category.equals("작성자")) {
			where += "NOTIWRITER LIKE '%" + keyword + "%'";
		} else if (category.equals("제목,내용")) {
			where += "(NOTITITLE LIKE '%" + keyword + "%' OR NOTICONTENT LIKE '%" + keyword + "%')";
		} else if (category.equals("제목")) {
			where += "NOTITITLE LIKE '%" + keyword + "%'";
		} else {
			where += "NOTITITLE LIKE '%%'";
		}

		where2.setWheres(where);
		int Count = qadao.qanoticeCount(where2);

		// ----------여기부터는 Count를 사용합니다.---------

		// 최대 게시글 갯수
		int maxPage = (int) (Math.ceil((double) Count / limit));
		// page 검사
		if (page > maxPage) {
			page = maxPage;
		}
		if (page <= 0) {
			page = 1;
		}

		// ----------여기부터는 page를 사용합니다.---------

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
		PAGE paging = new PAGE();
		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		// 검색을 위해 keyword, category, where를 넣는다.
		paging.setKeyword(keyword);
		paging.setCategory(category);
		paging.setWheres(where);
		paging.setCount(Count);

		// 검색한다.

		List<NOTICE> notice = qadao.qanoticeall(paging);

		// MODEL
		mav.addObject("notice", notice);
		mav.addObject("paging", paging);
		// VIEW
		mav.setViewName("Noti_List");
		return mav;
	}

	// 자주찾는질문
	public ModelAndView qarepquepList(int page, int limit, String category, String keyword) {

		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 전체 게시글 갯수를 DB에서 가져온다.
		String where = "";
		if (category.equals("제목,내용")) {
			where += "(rqTitle LIKE '%" + keyword + "%' OR rqContent LIKE '%" + keyword + "%')";
		} else if (category.equals("제목")) {
			where += "rqTitle LIKE '%" + keyword + "%'";
		} else {
			where += "rqTitle LIKE '%%'";
		}

		where2.setWheres(where);
		int Count = qadao.qarepqueCount(where2);

		// ----------여기부터는 Count를 사용합니다.---------

		// 최대 게시글 갯수
		int maxPage = (int) (Math.ceil((double) Count / limit));

		// page 검사
		if (page > maxPage) {
			page = maxPage;
		}
		if (page <= 0) {
			page = 1;
		}

		// ----------여기부터는 page를 사용합니다.---------

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
		PAGE paging = new PAGE();
		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		// 검색을 위해 keyword, category, where,count를 넣는다.
		paging.setKeyword(keyword);
		paging.setCategory(category);
		paging.setWheres(where);
		paging.setCount(Count);

		// 검색한다.
		List<REPQUE> repque = qadao.qarepqueall(paging);

		// MODEL
		mav.addObject("repque", repque);
		mav.addObject("paging", paging);
		// VIEW
		mav.setViewName("RepQue_List");
		return mav;
	}

	// 문의내역
	public ModelAndView qaquestpList(int page, int limit, String category, String keyword, String userId) {

		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 전체 게시글 갯수를 DB에서 가져온다.
		String where = "";
		if (category.equals("작성자")) {
			where += "quId LIKE '%" + keyword + "%'";
		} else if (category.equals("제목,내용")) {
			where += "(quTitle LIKE '%" + keyword + "%' OR quContent LIKE '%" + keyword + "%')";
		} else if (category.equals("제목")) {
			where += "quTitle LIKE '%" + keyword + "%'";
		} else {
			where += "quTitle LIKE '%%'";
		}

		where2.setWheres(where);
		where2.setMId(userId);

		int Count = qadao.qaquestCount(where2);

		if (userId.equals("admin")) {
			Count = qadao.adquestCount(where2);
		}

		// ----------여기부터는 Count를 사용합니다.---------

		// 최대 게시글 갯수
		int maxPage = (int) (Math.ceil((double) Count / limit));

		// page 검사
		if (page > maxPage) {
			page = maxPage;
		}
		if (page <= 0) {
			page = 1;
		}

		// ----------여기부터는 page를 사용합니다.---------

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
		PAGE paging = new PAGE();
		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		// 검색을 위해 keyword, category, where를 넣는다.
		paging.setKeyword(keyword);
		paging.setCategory(category);
		paging.setWheres(where);
		paging.setCount(Count);
		paging.setMId(userId);

		// 검색한다.
		List<QUEST> quest = qadao.qaquestall(paging);

		if (userId.equals("admin")) {
			quest = qadao.adquestall(paging);
		}

		// MODEL
		mav.addObject("quest", quest);
		mav.addObject("paging", paging);
		// VIEW
		mav.setViewName("Que_List");
		return mav;
	}

	// 문의사항 상세보기
	public ModelAndView quView(int quNum) {

		QUEST quest = qadao.quView(quNum);

		mav.addObject("view", quest);
		mav.setViewName("Que_View");

		return mav;
	}

	// 내 문의사항 삭제
	public ModelAndView quDelete(int quNum, String userId) {

		int result = qadao.rqDelete(quNum);

		if (result > 0) {
			mav.setViewName("redirect:Que_List?userId=" + userId);
		} else {
			mav.setViewName("Que_View");
		}

		return mav;
	}

	// 문의 사항 답변(관리자)
	public ModelAndView quAnswerWrite(QUEST quest) {

		int result = qadao.quAnswerWrite(quest);

		if (result > 0) {
			mav.setViewName("redirect:quView?quNum=" + quest.getQuNum());
		} else {
			mav.setViewName("redirect:quView?quNum=" + quest.getQuNum());
		}

		return mav;
	}

	// 문의사항 작성하기
	public ModelAndView quWrite(QUEST quest) {
		int result = qadao.quWrite(quest);

		if (result > 0) {
			mav.setViewName("redirect:/Que_List?userId=" + quest.getQuId());
		} else {
			mav.setViewName("Que_Write");
		}
		return mav;
	}

}
