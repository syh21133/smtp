package com.icia.smtp.dto;

import java.sql.Date;

import lombok.Data;

// 문의

@Data
public class QUEST {

	private int quNum;			// 문의 번호
	private String quTitle;		// 문의 제목
	private String quContent;	// 문의 내용
	private String quId;		// 문의 작성자
	private String quDate;		// 문의 날짜
	private int quHit;			// 문의 조회수
	private String quAnswer;	// 문의 답변
	private String quAnsDate;	// 문의 답변 날짜
}
