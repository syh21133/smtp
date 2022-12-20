package com.icia.smtp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dto.NOTICE;
import com.icia.smtp.service.NOTIService;

@Controller
public class NotiController {
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;

	@Autowired
	private NOTIService notisvc;

	// 공지사항 상세보기
	@RequestMapping(value = "/notiView", method = RequestMethod.GET)
	public ModelAndView notiView(@RequestParam("notiNum") int notiNum) {

		mav = notisvc.notiView(notiNum);

		return mav;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notiDelete", method = RequestMethod.GET)
	public ModelAndView notiDelete(@RequestParam("notiNum") int notiNum) {

		mav = notisvc.notiDelete(notiNum);

		return mav;
	}

	// 공지사항 작성

	@RequestMapping(value = "/notiWrite", method = RequestMethod.POST)
	public ModelAndView notiWrite(@ModelAttribute NOTICE notice) {

		mav = notisvc.notiWrite(notice);

		return mav;
	}

}
