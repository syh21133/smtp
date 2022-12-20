package com.icia.smtp.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.RQDAO;
import com.icia.smtp.dto.REPQUE;
import com.icia.smtp.service.RQService;

@Controller
public class RQController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;

	@Autowired
	private RQService rqsvc;
	
	@Autowired
	private RQDAO rqdao;

	// 자주찾는질문 상세보기
	@GetMapping(value = "/rqView")
	public ModelAndView rqView(@RequestParam("rqNum") int rqNum,
			 @SessionAttribute(name = "userId", required = false)String userId,
             HttpServletRequest request,
             HttpServletResponse response) {
		
		
		
		
		
        /* 조회수 로직 */
			Cookie oldCookie = null;
		    Cookie[] cookies = request.getCookies();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("postView")) {
		                oldCookie = cookie;
		            }
		        }
		    }
		    if(userId != null) {
		   
		    if (oldCookie != null) {
		        if (!oldCookie.getValue().contains("[" + userId.toString() + "]")) {
		        	rqdao.rqHit(rqNum);
		            oldCookie.setValue(oldCookie.getValue() + "_[" + userId + "]");
		            oldCookie.setPath("/");
		            oldCookie.setMaxAge(60 * 60 * 24);
		            response.addCookie(oldCookie);
		        }
		    } else {
		    	rqdao.rqHit(rqNum);
		        Cookie newCookie = new Cookie("postView","[" + userId + "]");
		        newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 24);
		        response.addCookie(newCookie);
		    } 	
		    }else {
		    	 if (oldCookie != null) {
				        if (!oldCookie.getValue().contains("[" + rqNum + "]")) {
				        	rqdao.rqHit(rqNum);
				            oldCookie.setValue(oldCookie.getValue() + "_[" + rqNum + "]");
				            oldCookie.setPath("/");
				            oldCookie.setMaxAge(60 * 60 * 24);
				            response.addCookie(oldCookie);
				        }
				    } else {
				    	rqdao.rqHit(rqNum);
				        Cookie newCookie = new Cookie("postView","[" + rqNum + "]");
				        newCookie.setPath("/");
				        newCookie.setMaxAge(60 * 60 * 24);
				        response.addCookie(newCookie);
				    } 	
		    	
		    }

		    mav = rqsvc.rqView(rqNum);    
		    
		return mav;
	}

	// 자주찾는질문 삭제
	@RequestMapping(value = "/rqDelete", method = RequestMethod.GET)
	public ModelAndView rqDelete(@RequestParam("rqNum") int rqNum) {

		mav = rqsvc.rqDelete(rqNum);

		return mav;
	}

	// 자주찾는질문 작성
	@RequestMapping(value = "/rqWrite", method = RequestMethod.POST)
	public ModelAndView rqWrite(@ModelAttribute REPQUE repque) {

		mav = rqsvc.rqWrite(repque);

		return mav;
	}
}
