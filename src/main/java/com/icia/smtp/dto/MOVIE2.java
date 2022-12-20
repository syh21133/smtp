package com.icia.smtp.dto;

import java.sql.Date;

import lombok.Data;

// 영화

@Data
public class MOVIE2 {

	private String mvTitle;		// 영화 제목
	private int mvTime;			// 영화 재생시간
	private int hour;			// 영화 재생시간(시)
	private int minutes;		// 영화 재생시간(분)
	private String mvGenre;		// 장르
	private Date mvDate;		// 개봉일
	private String mvDirector;	// 감독
	private int mvGrade;		// 등급
	private String mvContent;	// 줄거리
	private int mvAttendence;	// 관객수
	private String mvFilename;	// 영화 대표이미지
	


}


