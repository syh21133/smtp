package com.icia.smtp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.smtp.dto.REVIEW;
import com.icia.smtp.service.RVService;

@Controller
public class RVController {

	@Autowired
	private RVService rvsvc;

	// MOV011 : 리뷰 불러오기
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public @ResponseBody List<REVIEW> rvList(@RequestParam("mvTitle") String rvTitle) {

		List<REVIEW> reviewList = rvsvc.rvList(rvTitle);

		return reviewList;
	}

	// MOV011 : 리뷰 갯수 불러오기reviewCnt
	@RequestMapping(value = "/reviewCnt", method = RequestMethod.GET)
	public @ResponseBody int reviewCnt(@RequestParam("mvTitle") String rvTitle) {

		int reviewCnt = rvsvc.rvCnt(rvTitle);

		return reviewCnt;
	}

	// MOV012 : 리뷰 작성하기
	@RequestMapping(value = "/rvWrite", method = RequestMethod.POST)
	public @ResponseBody List<REVIEW> rvWrite(@ModelAttribute REVIEW review) {

		List<REVIEW> reviewList = rvsvc.rvWrite(review);

		return reviewList;
	}

	// MOV013 : 리뷰 삭제하기 rvDelete
	@RequestMapping(value = "/rvDelete", method = RequestMethod.POST)
	public @ResponseBody List<REVIEW> rvDelete(@ModelAttribute REVIEW review) {

		List<REVIEW> reviewList = rvsvc.rvDelete(review);

		return reviewList;
	}

}
