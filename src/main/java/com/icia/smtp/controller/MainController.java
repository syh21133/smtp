package com.icia.smtp.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.service.MainService;

//어노테이션
@Controller
public class MainController {

	// ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;
	
	// Service에 연결
	@Autowired
	MainService mainsvc;

	// --------------------------- 시작 ----------------------------------------
	// 프로젝트 시작페이지 ( RequestMapping value값이 "/" 일때 )
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * start() { System.out.println("11"); return "menuforpage"; }
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(@CookieValue(value="loginId", required=false) Cookie cookie) {

	    if (cookie != null) {
            session.setAttribute("userId", cookie.getValue());        
	    	}
	    
	    mav = mainsvc.index();
		
		return mav;
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index1(@CookieValue(value="loginId", required=false) Cookie cookie) {

		
	    if (cookie != null) {
	                session.setAttribute("userId", cookie.getValue());        
	    }
		
		mav = mainsvc.index();

		return mav;
	}

	@RequestMapping(value = "/for404", method = RequestMethod.GET)
	public String for404() {
		return "save/404";
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "save/about";
	}

	@RequestMapping(value = "/apps-download", method = RequestMethod.GET)
	public String apps_download() {
		return "save/apps-download";
	}

	@RequestMapping(value = "/blog-details", method = RequestMethod.GET)
	public String blog_details() {
		return "save/blog-details";
	}

	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blog() {
		return "save/blog";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {
		return "save/contact";
	}

	@RequestMapping(value = "/event-checkout", method = RequestMethod.GET)
	public String event_checkout() {
		return "save/event-checkout";
	}

	@RequestMapping(value = "/event-details", method = RequestMethod.GET)
	public String event_details() {
		return "save/event-details";
	}

	@RequestMapping(value = "/event-speaker", method = RequestMethod.GET)
	public String event_speaker() {
		return "save/event-speaker";
	}

	@RequestMapping(value = "/event-ticket", method = RequestMethod.GET)
	public String event_ticket() {
		return "save/event-ticket";
	}

	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String events() {
		return "save/events";
	}

	@RequestMapping(value = "/index-2", method = RequestMethod.GET)
	public String index_2() {
		return "save/index-2";
	}

	/*
	 * @RequestMapping(value = "/index", method = RequestMethod.GET) public String
	 * index() { return "save/index"; }
	 */

	@RequestMapping(value = "/movie-checkout", method = RequestMethod.GET)
	public String movie_checkout() {
		return "save/movie-checkout";
	}

	@RequestMapping(value = "/movie-details-2", method = RequestMethod.GET)
	public String movie_details_2() {
		return "save/movie-details-2";
	}

	@RequestMapping(value = "/movie-details", method = RequestMethod.GET)
	public String movie_details() {
		return "save/movie-details";
	}

	@RequestMapping(value = "/movie-grid", method = RequestMethod.GET)
	public String movie_grid() {
		return "save/movie-grid";
	}

	@RequestMapping(value = "/movie-list", method = RequestMethod.GET)
	public String movie_list() {
		return "save/movie-list";
	}

	@RequestMapping(value = "/movie-seat-plan", method = RequestMethod.GET)
	public String movie_seat_plan() {
		return "save/movie-seat-plan";
	}

	@RequestMapping(value = "/movie-ticket-plan", method = RequestMethod.GET)
	public String movie_ticket_plan() {
		return "save/movie-ticket-plan";
	}

	@RequestMapping(value = "/popcorn", method = RequestMethod.GET)
	public String popcorn() {
		return "save/popcorn";
	}

	@RequestMapping(value = "/sign-in", method = RequestMethod.GET)
	public String sign_in() {
		return "save/sign-in";
	}

	@RequestMapping(value = "/sign-up", method = RequestMethod.GET)
	public String sign_up() {
		return "save/sign-up";
	}

	@RequestMapping(value = "/sport-details", method = RequestMethod.GET)
	public String sport_details() {
		return "save/sport-details";
	}

	@RequestMapping(value = "/sports-checkout", method = RequestMethod.GET)
	public String sports_checkout() {
		return "save/sports-checkout";
	}

	@RequestMapping(value = "/sports-ticket", method = RequestMethod.GET)
	public String sports_ticket() {
		return "save/sports-ticket";
	}

	@RequestMapping(value = "/sports", method = RequestMethod.GET)
	public String sports() {
		return "save/sports";
	}

	@RequestMapping(value = "/BookMain", method = RequestMethod.GET)
	public ModelAndView BookMain() {
		mav.setViewName("redirect:forSearchTicket");
		return mav;
	}

	// IND009 : index페이지
	@RequestMapping(value = "/P_index", method = RequestMethod.GET)
	public ModelAndView P_index() {
		mav = mainsvc.P_index();
		return mav;
	}

	@RequestMapping(value = "/CS", method = RequestMethod.GET)
	public ModelAndView CS(@RequestParam(value = "userId", required = false) String userId,
			@CookieValue(value="loginId", required=false) Cookie cookie) {

		 if (cookie != null) {
             session.setAttribute("userId", cookie.getValue());
             userId=cookie.getValue();
		 }
		mav = mainsvc.CS(userId);

		return mav;
	}

}
