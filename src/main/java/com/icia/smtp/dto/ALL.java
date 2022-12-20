package com.icia.smtp.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ALL {
	
	private int acNum;			// 배우번호
	private String acName;		// 배우이름
	private String acProfile;	// 프로필사진
	
	private int bookNum;	// 예매번호
	private String bookId;	// 아이디
	private String botiNum; // 티켓번호
	
	private int caNum;		// 출연자 번호
	private String caTitle;	// 영화제목
	private int cacNum;		// 배우 번호
	
	private int ciNum;			// 영화관 번호
	private String ciName;		// 영화관 이름
	private String ciRegion;	// 영화관 지역
	private String ciRoom;		// 영화관 A~G관
	private int cinemaNum;	
	
	private int favNum;			// 찜하기번호
	private String favId; 		// 아이디
	private String favTitle;	// 영화제목
	
	private String mvTitle;		// 영화 제목
	private int mvTime;			// 영화 재생시간
	private String mvGenre;		// 장르
	private Date mvDate;		// 개봉일
	private String mvDirector;	// 감독
	private int mvGrade;		// 등급
	private String mvContent;	// 줄거리
	private int mvAttendence;	// 관객수
	private String mvFilename;
	
	private int poNum;			// 포스터번호
	private String poTitle;		// 영화 제목
	private String poFilename;	// 포스터 파일
	
	private int teaNum;			// 예고편 번호
	private String teaTitle;	// 영화 제목
	private String teaFilename;	// 예고편 파일
	
	private int ticNum;			// 티켓번호
	private int ticiNum;		// 영화관 번호
	private String ticTime;		// 영화 상영시간
	private String ticTitle;	// 영화 제목
	private int ticSeat;		// 남은 좌석
	private Date ticDate;		// 예매한 날짜
	private int tcinemaNum;
	
	private String userId;		// 아이디
	private String userPw;		// 비밀번호
	private String userName;	// 이름
	private Date userBirth;		// 생년월일
	private String userGender;	// 성별
	private String userEmail;	// 이메일
	
	private MultipartFile userProfile; // 프로필사진
	private String userProfileName; // 프로필사진이름
	
	private int page;		// 현재페이지
	private int maxPage;	// 최대페이지
	private int startPage;	// 시작페이지
	private int endPage;	// 마지막페이지
	private int startRow;	// 페이지 시작 게시글번호
	private int endRow;		// 페이지 마지막 게시글번호
	private int limit;		// 한 페이지에 출력할 게시글 갯수
	private String mId;
	private String category;
	private String keyword;


}
