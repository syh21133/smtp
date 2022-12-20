package com.icia.smtp.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dto.CASTS;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.service.MVService;

@Controller
public class MVController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private MVService mvsvc;
	@Autowired
	private HttpSession session;

	// MOV001 : 영화 추가 페이지로 이동(관리자만)
	@RequestMapping(value = "/mvAddForm", method = RequestMethod.GET)
	public String mvAddForm() {
		return "mvAddForm";
	}

	// MOV004 : 영화 정보 추가
	@RequestMapping(value = "/mvAdd", method = RequestMethod.POST)
	public ModelAndView mvAdd(@ModelAttribute MOVIE movie, @ModelAttribute CASTS casts)
			throws IllegalStateException, IOException {

		mav.setViewName("index");

		return mav;
	}

	// MOV010 : 영화 정보 상세보기
	@RequestMapping(value = "/mvView", method = RequestMethod.GET)
	public ModelAndView mvView(@RequestParam("mvTitle") String mvTitle) {

		mav = mvsvc.mvView(mvTitle);

		return mav;
	}

	@RequestMapping(value = "/movieList", method = RequestMethod.GET)
	public ModelAndView movieList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "6") int limit,
			@CookieValue(value="loginId", required=false) Cookie cookie) {

		if (cookie != null) {
            session.setAttribute("userId", cookie.getValue());        
}
		
		if (page <= 0) {
			page = 1;
		}

		mav = mvsvc.mvList(page, limit);

		return mav;
	}

}
