package com.icia.smtp.dto;

import java.sql.Date;

import lombok.Data;

// 예매 티켓정보

@Data
public class TICKET {

	private int ticNum;			// 티켓번호
	private int ticiNum;		// 영화관 번호
	private String ticTime;		// 영화 상영시간
	private String ticTitle;	// 영화 제목
	private int ticSeat;		// 남은 좌석
	private Date ticDate;		// 예매한 날짜
	private int tcinemaNum;
}
