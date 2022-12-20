package com.icia.smtp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dto.CINEMA;
import com.icia.smtp.dto.USERS;
import com.icia.smtp.service.MemService;

@Controller
public class MemController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;

	@Autowired
	private MemService msvc;

	// MEM001
	@RequestMapping(value = "/JoinForm", method = RequestMethod.GET)
	public String JoinForm() {

		return "JoinForm";
	}

	// MEM006
	@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
	public ModelAndView mJoin(@ModelAttribute USERS user) throws IllegalStateException, IOException {

		mav = msvc.memJoin(user);

		return mav;
	}

	// MEM002
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public @ResponseBody String idoverlap(@RequestParam("userId") String userId) {

		String result = msvc.idCheck(userId);

		return result;
	}

	// MEM008
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {

		return "loginForm";
	}

	// MEM009
	/*
	 * @RequestMapping(value = "/memberLogin", method = RequestMethod.POST) public
	 * ModelAndView memberLogin(@ModelAttribute USERS user) {
	 * 
	 * mav =msvc.memberLogin(user);
	 * 
	 * 
	 * return mav; }
	 */

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody int login(@ModelAttribute USERS user,
			@RequestParam("loginCookie") boolean loginCookie,
			HttpServletRequest request,
            HttpServletResponse response) {

		
			int result = msvc.login(user);
		
			System.out.println(loginCookie);
			if(result>0) {
			if(loginCookie) {
			  Cookie newCookie = new Cookie("loginId",user.getUserId()); 
			  newCookie.setPath("/"); 
			  newCookie.setMaxAge(60 * 60 * 24);
			  response.addCookie(newCookie); 
		  }
	  }
			
		

		return result;
	}

	// MEM013
	@RequestMapping(value = "/memberLogout", method = RequestMethod.GET)
	public String mLogout(HttpServletRequest request,
            HttpServletResponse response) {
		
		
	    Cookie newCookie = new Cookie("loginId", null);  // 쿠키 값을 null로 설정
	    newCookie.setPath("/"); 
	    newCookie.setMaxAge(0);  // 남은 만료시간을 0으로 설정
	    response.addCookie(newCookie);
	    
		
		
		session.invalidate();
		
		 

		return "redirect:/index";
	}

	// MEM014
	@RequestMapping(value = "/memberMyView", method = RequestMethod.GET)
	public ModelAndView memberMyView(@RequestParam("userId") String userId) {

		mav = msvc.memberMyView(userId);

		return mav;
	}

	// MEM015
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public ModelAndView mDel(@RequestParam("userId") String userId, @RequestParam("admin") String admin) {

		mav = msvc.memDel(userId, admin);

		return mav;
	}

	// MEM017
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public ModelAndView memberModify(@RequestParam("userId") String userId) {

		mav = msvc.memberModify(userId);

		return mav;
	}

	// MEM018
	@RequestMapping(value = "/memberModifyProcess", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(@ModelAttribute USERS user) throws IllegalStateException, IOException {

		mav = msvc.memberModifyProcess(user);

		return mav;
	}

	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public ModelAndView bookList(@RequestParam("userId") String userId,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "6") int limit) {

		if (page <= 0) {
			page = 1;
		}

		mav = msvc.bookList(userId, page, limit);

		return mav;
	}

}
