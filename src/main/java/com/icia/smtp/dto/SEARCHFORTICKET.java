package com.icia.smtp.dto;

import lombok.Data;

// 배우

@Data
public class SEARCHFORTICKET {
	
	private String ciRegion;		//지역
	private String ticDate;			//날짜
	private String ciName;			//이름
	private String methodForSort;	//배열방식
	private String keyword;			//검색키워드
	private String formvGenre;		//장르를 get방식으로 보낼때 사용
	private String mvGenrelist;		//장르
	private String where;			//sql에 where문에 적용될 조건문
	private int methodarray;		//배치방식
	
	private int page;				// 현재페이지
	private int maxPage;			// 최대페이지
	private int startPage;			// 시작페이지
	private int endPage;			// 마지막페이지
	private int startRow;			// 페이지 시작 게시글번호
	private int endRow;				// 페이지 마지막 게시글번호
	private int limit;				// 한 페이지에 출력할 게시글 갯수
	
	private int tiCount;			
	
	public SEARCHFORTICKET(String ciRegion,String ticDate, String ciName, String methodForSort, String keyword,
			int page, int limit, String mvGenrelist,String formvGenre,int methodarray) {
		super();
		this.ciRegion = ciRegion;
		this.ticDate = ticDate;
		this.ciName = ciName;
		this.methodForSort = methodForSort;
		this.keyword = keyword;
		this.page = page;
		this.limit = limit;
		this.mvGenrelist = mvGenrelist;
		this.formvGenre=formvGenre;
		this.methodarray=methodarray;
	}
	
	
	
}
