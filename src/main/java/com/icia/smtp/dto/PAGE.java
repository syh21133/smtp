package com.icia.smtp.dto;

import lombok.Data;

@Data
public class PAGE {
	private int page;			// 현재페이지
	private int maxPage;		// 최대페이지
	private int startPage;		// 시작페이지
	private int endPage;		// 마지막페이지
	private int startRow;		// 페이지 시작 게시글번호
	private int endRow;			// 페이지 마지막 게시글번호
	private int limit;			// 한 페이지에 출력할 게시글 갯수
	private String keyword;		// 검색 키워드
	private String category;	// 검색 종류
	private String wheres;		// 종류+키워드
	private int count;			// 게시물 개수
	private String mId;			// 
}
