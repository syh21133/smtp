package com.icia.smtp.dto;

import lombok.Data;

// 영화 예고편

@Data
public class MOVIETEASER {

	
	private int teaNum;			// 예고편 번호
	private String teaTitle;	// 영화 제목
	private String teaFilename;	// 예고편 파일
	
}
