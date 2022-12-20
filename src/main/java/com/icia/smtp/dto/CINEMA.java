package com.icia.smtp.dto;

import lombok.Data;

// 영화관

@Data
public class CINEMA {

	
	private int ciNum;			// 영화관 번호
	private String ciName;		// 영화관 이름
	private String ciRegion;	// 영화관 지역
	private String ciRoom;		// 영화관 A~G관
	private int cinemaNum;	
}
