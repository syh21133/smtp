package com.icia.smtp.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class REVIEW {
	
	private int rvNum;			// 리뷰 일련번호
	private String rvId;		// 작성자
	private String rvContent;	// 내용
	private String rvDate;		// 날짜, 시간
	private int rvGrade;		// 평점
	private String rvTitle;		// 영화 제목
	
}
