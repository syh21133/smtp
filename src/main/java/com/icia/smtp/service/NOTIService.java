package com.icia.smtp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.controller.QAController;
import com.icia.smtp.dao.NOTIDAO;
import com.icia.smtp.dto.NOTICE;

@Service
public class NOTIService {
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private BCryptPasswordEncoder pwEnc;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private NOTIDAO dao;

	@Autowired
	private QAController qacon;

	// 공지사항 상세보기
	public ModelAndView notiView(int notiNum) {

		NOTICE notice = dao.notiView(notiNum);

		mav.addObject("view", notice);
		mav.setViewName("Noti_View");

		return mav;
	}

	// 공지사항 삭제
	public ModelAndView notiDelete(int notiNum) {

		int result = dao.notiDelete(notiNum);

		if (result > 0) {
			mav.setViewName("redirect:Noti_List");
		} else {
			mav.setViewName("Noti_View");
		}

		return mav;
	}

	// 문의사항 작성하기
	public ModelAndView notiWrite(NOTICE notice) {
		int result = dao.notiWrite(notice);

		if (result > 0) {
			mav.setViewName("redirect:/Noti_List");
		} else {
			mav.setViewName("Noti_Write");
		}
		return mav;
	}

}
