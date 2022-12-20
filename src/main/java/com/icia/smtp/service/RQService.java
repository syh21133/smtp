package com.icia.smtp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.RQDAO;
import com.icia.smtp.dto.REPQUE;

@Service
public class RQService {
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
	private RQDAO rqdao;

	// 자주찾는 질문 상세보기
	public ModelAndView rqView(int rqNum) {

		REPQUE repque = rqdao.rqView(rqNum);

		mav.addObject("view", repque);
		mav.setViewName("RepQue_View");

		return mav;
	}

	// 자주찾는 질문 삭제
	public ModelAndView rqDelete(int rqNum) {

		int result = rqdao.rqDelete(rqNum);

		if (result > 0) {
			mav.setViewName("redirect:RepQue_List");
		} else {
			mav.setViewName("RepQue_View");
		}

		return mav;
	}

	// 자주찾는 질문 추가(관리자)
	public ModelAndView rqWrite(REPQUE repque) {
		int result = rqdao.rqWrite(repque);

		if (result > 0) {
			mav.setViewName("redirect:/RepQue_List");
		} else {
			mav.setViewName("RepQue_Write");
		}
		return mav;
	}

}
