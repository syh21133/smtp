package com.icia.smtp.dto;

import java.sql.Date;

import lombok.Data;

// 영화포스터

@Data
public class MOVIEPOSTER {
	
	private int poNum;			// 포스터번호
	private String poTitle;		// 영화 제목
	private String poFilename;	// 포스터 파일

	
}
