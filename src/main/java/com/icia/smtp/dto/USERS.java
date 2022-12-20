package com.icia.smtp.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

// 회원

@Data
public class USERS {
	
	private String userId;		// 아이디
	private String userPw;		// 비밀번호
	private String userName;	// 이름
	private Date userBirth;		// 생년월일
	private String userGender;	// 성별
	private String userEmail;	// 이메일

	private MultipartFile userProfile; // 프로필사진
	private String userProfileName; // 프로필사진이름

}
