package com.icia.smtp.dto;

import java.sql.Date;

import lombok.Data;



// 문의

@Data
public class NOTICE {

	private int notiNum;			// 문의 번호
	private String notiTitle;		// 문의 제목
	private String notiContent;		// 문의 내용
	private String notiDate;		// 문의 날짜
	private String notiWriter;		// 문의 작성자
	
}
