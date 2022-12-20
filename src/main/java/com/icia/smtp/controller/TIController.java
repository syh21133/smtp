package com.icia.smtp.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dto.CINEMA;
import com.icia.smtp.dto.TICKET;
import com.icia.smtp.service.TIService;

//어노테이션
@Controller
public class TIController {

	// ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// Service에 연결
	@Autowired
	TIService tisvc;

	@Autowired
	private HttpSession session;

	// forSearchTicket : 영화 상영작 검색기능
	// MOV025+MOV027+MOV028
	@RequestMapping(value = "/forSearchTicket", method = RequestMethod.GET) // 405 뜨면 method를 바꿔보자
	public ModelAndView forSearchTicket(
			@RequestParam(value = "ciRegion", required = false, defaultValue = "all") String ciRegion,
			@RequestParam(value = "ticDate", required = false, defaultValue = "all") String ticDate,
			@RequestParam(value = "ciName", required = false, defaultValue = "all") String ciName,
			@RequestParam(value = "methodForSort", required = false, defaultValue = "sort_title") String methodForSort,
			@RequestParam(value = "genre", required = false, defaultValue = "") String[] mvGenre,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "12") int limit,
			@RequestParam(value = "methodarray", required = false, defaultValue = "1") int methodarray,
			@CookieValue(value="loginId", required=false) Cookie cookie) {

		if (cookie != null) {
            session.setAttribute("userId", cookie.getValue());        
}
		
		mav = tisvc.tipList(ciRegion, ticDate, ciName, methodForSort, mvGenre, keyword, page, limit, methodarray);

		return mav;
	}

	@RequestMapping(value = "/mvBook", method = RequestMethod.GET)
	public ModelAndView mvBook(@RequestParam("mvTitle") String mvTitle) {

		mav = tisvc.mvBook(mvTitle);
		session.setAttribute("mvTitle", mvTitle);

		return mav;
	}

	@RequestMapping(value = "/ciRegion", method = RequestMethod.POST)
	public @ResponseBody List<CINEMA> ciRegion(@RequestParam("ciRegion") String ciRegion) {

		List<CINEMA> cinemaList = tisvc.ciRegion(ciRegion);

		return cinemaList;
	}

	@RequestMapping(value = "/ciName", method = RequestMethod.POST)
	public @ResponseBody List<TICKET> ciName(@RequestParam("ciName") String ciName,
			@RequestParam("ciRegion") String ciRegion, @RequestParam("mvTitle") String mvTitle) {

		List<TICKET> ciDateList = tisvc.ciDate(ciName, ciRegion, mvTitle);
		return ciDateList;
	}

	@RequestMapping(value = "/ciName2", method = RequestMethod.POST)
	public @ResponseBody List<TICKET> ciName2(@RequestParam("ciName") String ciName,
			@RequestParam("ciRegion") String ciRegion) {
		List<TICKET> ciDateList = tisvc.ciDate2(ciName, ciRegion);
		return ciDateList;
	}

	@RequestMapping(value = "/ciRoom", method = RequestMethod.POST)
	public @ResponseBody List<CINEMA> ciRoom(@RequestParam("tcinemaNum") int tcinemaNum,
			@RequestParam("ticDate") Date ticDate) {

		List<CINEMA> ciRoomList = tisvc.ciRoom(tcinemaNum);

		return ciRoomList;
	}

	@RequestMapping(value = "/ciTime", method = RequestMethod.POST)
	public @ResponseBody List<TICKET> ciTime(@RequestParam("ciNum") int ciNum, @RequestParam("ciRoom") String ciRoom,
			@RequestParam("ticDate") Date ticDate, @RequestParam("ticTitle") String ticTitle) {

		List<TICKET> ciTimeList = tisvc.ciTime(ciRoom, ciNum, ticDate, ticTitle);

		return ciTimeList;
	}

	@RequestMapping(value = "/ticketBook", method = RequestMethod.GET)
	public ModelAndView ticketBook(@ModelAttribute TICKET ticket) {

		

		mav = tisvc.ticketBook(ticket);

		return mav;
	}
}
