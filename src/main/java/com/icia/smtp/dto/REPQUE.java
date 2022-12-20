package com.icia.smtp.dto;

import java.sql.Date;

import lombok.Data;


// 자주찾는 질문

@Data
public class REPQUE {
	
	private int rqNum;			// 질문 번호
	private String rqTitle;		// 질문 제목
	private String rqContent;	// 질문 내용
	private int rqHit;			// 질문 조회수
	private String rqDate;

}
