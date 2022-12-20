package com.icia.smtp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.smtp.dao.RVDAO;
import com.icia.smtp.dto.REVIEW;

@Service
public class RVService {

	@Autowired
	private RVDAO rvdao;

	// MOV011 : 리뷰 불러오기
	public List<REVIEW> rvList(String rvTitle) {

		List<REVIEW> reviewList = rvdao.rvList(rvTitle);

		return reviewList;
	}

	// MOV011 : 리뷰 갯수 불러오기
	public int rvCnt(String rvTitle) {

		int reviewCnt = rvdao.rvCnt(rvTitle);

		return reviewCnt;
	}

	// MOV012 : 리뷰 작성하기
	public List<REVIEW> rvWrite(REVIEW review) {

		List<REVIEW> reviewList;

		int result = rvdao.rvWrite(review);

		if (result > 0) {
			reviewList = rvdao.rvList(review.getRvTitle());

		} else {
			reviewList = null;
		}

		return reviewList;
	}

	// MOV013 : 리뷰 삭제하기
	public List<REVIEW> rvDelete(REVIEW review) {

		List<REVIEW> reviewList;

		int result = rvdao.rvDelete(review);

		if (result > 0) {
			reviewList = rvdao.rvList(review.getRvTitle());
		} else {
			reviewList = null;
		}

		return reviewList;
	}

}
