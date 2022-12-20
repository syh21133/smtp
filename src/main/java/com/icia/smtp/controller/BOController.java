package com.icia.smtp.controller;

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

import com.icia.smtp.dto.BOOK;
import com.icia.smtp.service.BOService;

@Controller
public class BOController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;

	@Autowired
	private BOService bosvc;

	@RequestMapping(value = "/tiBook", method = RequestMethod.GET)
	public ModelAndView tiBook(@ModelAttribute BOOK book,
			@CookieValue(value="loginId", required=false) Cookie cookie) {

		if (cookie != null) {
            session.setAttribute("userId", cookie.getValue());        
		 }
		
		mav = bosvc.tiBook(book);

		return mav;
	}

	// deletebook : 예매한 티켓 취소하기
	@RequestMapping(value = "/deletebook", method = RequestMethod.GET)
	public ModelAndView deletebook(@RequestParam("bookNum") String bookNum, @RequestParam("userId") String userId,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "6") int limit,
			@CookieValue(value="loginId", required=false) Cookie cookie) {

		if (cookie != null) {
            session.setAttribute("userId", cookie.getValue());        
		 }
		
		mav = bosvc.deletebook(bookNum, userId, page, limit);

		return mav;
	}

}
