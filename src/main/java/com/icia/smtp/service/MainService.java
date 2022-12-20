package com.icia.smtp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.MainDAO;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.MOVIE2;
import com.icia.smtp.dto.NOTICE;
import com.icia.smtp.dto.QUEST;
import com.icia.smtp.dto.REPQUE;

@Service
public class MainService {

	// [1]ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// [2]DAO 연결(Repository)
	@Autowired
	private MainDAO maindao;

	@Autowired
	private HttpServletRequest request;


	// 메인페이지
	public ModelAndView P_index() {
		
		//dao에서 인기작 top5 가져오기
		List<MOVIE2> moviealltop5 = maindao.P_indexalltop5();
				
		
		// MODEL
		mav.addObject("moviealltop5", moviealltop5);
		// VIEW
		mav.setViewName("P_index");
		return mav;
	}
	
	public ModelAndView index() {
		
		List<MOVIE> movie = maindao.atList();
		
		mav.addObject("atList",movie);
		
		movie=maindao.dateList();
		
		mav.addObject("dateList",movie);
		
		mav.setViewName("index");
				
		
		
		return mav;
	}

	public ModelAndView CS(String userId) {
		
		List<NOTICE> notiList = maindao.notiList();
		List<REPQUE> rqList = maindao.rqList();
		if(userId != null) {
			
			if(userId.equals("admin")) {
				
				
				List<QUEST> quList = maindao.adquList();
				mav.addObject("quList",quList);
				
			}else {
			
			
			List<QUEST> quList = maindao.quList(userId);
			mav.addObject("quList",quList);
			
			}
		
		}
		
		mav.addObject("rqList",rqList);
		mav.addObject("notiList",notiList);
		
		mav.setViewName("CS");
		
		
		return mav;
	}

}
