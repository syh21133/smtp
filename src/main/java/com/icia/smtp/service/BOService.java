package com.icia.smtp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.BODAO;
import com.icia.smtp.dto.BOOK;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.TICKET;



@Service
public class BOService {
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
	private BODAO dao;

	public ModelAndView tiBook(BOOK book) {
		
		TICKET ticket = dao.ticket(book);
		dao.update(ticket);
		
		int result = dao.tiBook(book);
		
		if (result > 0) {
			mav.setViewName("index");
		} 
		
		return mav;
	}
	//예매 취소 메소드
		public ModelAndView deletebook(String bookNum, String userId,int page, int limit) {

			int result = dao.deletebookList(bookNum);

			
			
			if (result > 0) {
				mav.setViewName("redirect:bookList?userId="+userId+"&page="+page+"&limit="+limit);
			} else {
				mav.setViewName("redirect:bookList?userId="+userId+"&page="+page+"&limit="+limit);
			}
			return mav;
		}
	
	

}
