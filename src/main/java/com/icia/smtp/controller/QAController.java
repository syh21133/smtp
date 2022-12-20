package com.icia.smtp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dto.QUEST;
import com.icia.smtp.service.QAService;

//어노테이션
@Controller
public class QAController {

	// ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// Service에 연결
	@Autowired
	QAService qasvc;

	/*
	 * // QUE001 : 공지,자주찾는질문,문의 5개씩 보여주기
	 * 
	 * @RequestMapping(value = "/CS", method = RequestMethod.GET) // 405 뜨면 method를
	 * 바꿔보자 public ModelAndView board(@RequestParam(value = "userId", required =
	 * false, defaultValue = "null") String userId) {
	 * System.out.println("자주찾는질문+공지사항+내문의내역 게시판"); mav = qasvc.qapList(userId);
	 * return mav; }
	 */

	// 공지사항(페이징,검색)
	@RequestMapping(value = "/Noti_List", method = RequestMethod.GET) // 405 뜨면 method를 바꿔보자
	public ModelAndView notice(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "category", required = false, defaultValue = "") String category,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

		mav = qasvc.qanoticepList(page, limit, category, keyword);
		return mav;
	}

	// 자주찾는질문(페이징,검색)
	@RequestMapping(value = "/RepQue_List", method = RequestMethod.GET) // 405 뜨면 method를 바꿔보자
	public ModelAndView reque(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "category", required = false, defaultValue = "") String category,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

		mav = qasvc.qarepquepList(page, limit, category, keyword);
		return mav;
	}

	// 내 문의내역(페이징,검색)
	@RequestMapping(value = "/Que_List", method = RequestMethod.GET) // 405 뜨면 method를 바꿔보자
	public ModelAndView quest(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "category", required = false, defaultValue = "") String category,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam("userId") String userId) {

		mav = qasvc.qaquestpList(page, limit, category, keyword, userId);
		return mav;

	}

	// 내 문의내역 상세보기
	@RequestMapping(value = "/quView", method = RequestMethod.GET)
	public ModelAndView quView(@RequestParam("quNum") int quNum) {

		mav = qasvc.quView(quNum);

		return mav;
	}

	// 내 문의 내역 삭제quDelete
	@RequestMapping(value = "/quDelete", method = RequestMethod.GET)
	public ModelAndView quDelete(@RequestParam("quNum") int quNum, @RequestParam("userId") String userId) {

		mav = qasvc.quDelete(quNum, userId);

		return mav;
	}

	// 문의 사항 답변(관리자)
	@RequestMapping(value = "/quAnswerWrite", method = RequestMethod.GET)
	public ModelAndView quAnswerWrite(@ModelAttribute QUEST quest) {

		mav = qasvc.quAnswerWrite(quest);

		return mav;
	}

	// 문의 작성 페이지로
	@RequestMapping(value = "/quWriteForm", method = RequestMethod.GET)
	public String quWriteForm(@RequestParam("userId") String userId) {

		return "Que_Write";
	}

	// 공지 작성 페이지로
	@RequestMapping(value = "/notiWriteForm", method = RequestMethod.GET)
	public String notiWriteForm(@RequestParam("userId") String userId) {

		return "Noti_Write";
	}

	// 자주찾는 질문 작성 페이지로
	@RequestMapping(value = "/rqWriteForm", method = RequestMethod.GET)
	public String rqWriteForm() {

		return "RepQue_Write";
	}

	// 질문 작성
	@RequestMapping(value = "/quWrite", method = RequestMethod.POST)
	public ModelAndView quWrite(@ModelAttribute QUEST quest) {

		mav = qasvc.quWrite(quest);

		return mav;
	}

}
