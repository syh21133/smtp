package com.icia.smtp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.smtp.dao.MemDAO;
import com.icia.smtp.dto.ALL;
import com.icia.smtp.dto.USERS;

@Service
public class MemService {
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private MemDAO dao;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private BCryptPasswordEncoder pwEnc;

	@Autowired
	private JavaMailSender mailSender;

	public ModelAndView memJoin(USERS user) throws IllegalStateException, IOException {

		MultipartFile userProfile = user.getUserProfile();

		UUID uuid = UUID.randomUUID();

		if (!userProfile.isEmpty()) {
			String fileName = uuid.toString().substring(0, 8) + "_" + userProfile.getOriginalFilename();

			user.setUserProfileName(fileName);

			String savePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");

			userProfile.transferTo(new File(savePath + fileName));

		} else {
			String filename = userProfile.getOriginalFilename();
			user.setUserProfileName(filename);
		}

		user.setUserPw(pwEnc.encode(user.getUserPw()));

		int result = dao.memJoin(user);
 
		System.out.println(result);
		
		if (result > 0) { 
			mav.setViewName("redirect:/index");
		} else {
			mav.setViewName("JoinForm");
		}
		return mav;
	}

	public String idCheck(String userId) {
		String checkId = dao.checkId(userId);
		String result;

		if (checkId == null) {
			result = "OK";
		} else {
			result = "NO";
		}

		return result;
	}

	/*
	 * public ModelAndView memberLogin(USERS user) {
	 * 
	 * USERS encPw = dao.memberLogin(user);
	 * 
	 * if (pwEnc.matches(user.getUserPw(), encPw.getUserPw())) {
	 * session.setAttribute("userId", user.getUserId());
	 * session.setAttribute("userProfileName", encPw.getUserProfileName());
	 * mav.setViewName("redirect:/index"); } else { mav.setViewName("loginForm"); }
	 * 
	 * return mav; }
	 */

	public int login(USERS user) {
		int result = 0;
		USERS encPw = dao.memberLogin(user);

		if (pwEnc.matches(user.getUserPw(), encPw.getUserPw())) {
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userProfileName", encPw.getUserProfileName());
			result = 1;
		} else {
			result = 0;
		}

		return result;
	}

	public ModelAndView memberMyView(String userId) {

		USERS user = dao.memberMyView(userId);

		mav.setViewName("memberMyView");
		mav.addObject("view", user);

		return mav;
	}

	public ModelAndView memDel(String userId, String admin) {
		int result = dao.memDel(userId);

		if (result > 0) {

			/*
			 * if (admin.equals("admin")) { mav.setViewName("redirect:/mList"); } else {
			 */
			session.invalidate();
			mav.setViewName("index");
//		}

		} else {
			mav.setViewName("index");
		}

		return mav;
	}

	public ModelAndView memberModify(String userId) {

		USERS user = dao.memberMyView(userId);

		mav.setViewName("memberModify");
		mav.addObject("modi", user);

		return mav;
	}

	public ModelAndView memberModifyProcess(USERS user) throws IllegalStateException, IOException {

		MultipartFile userProfile = user.getUserProfile();

		UUID uuid = UUID.randomUUID();

		if (userProfile.getOriginalFilename().isEmpty()) {
			String fileName = user.getUserProfileName();
			user.setUserProfileName(fileName);

		} else {

			if (userProfile != null) {

				String deletePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");
				File deleteFile = new File(deletePath + user.getUserProfileName());
				if (deleteFile.exists()) {
					deleteFile.delete();

				} else {

				}

				String fileName = uuid.toString().substring(0, 8) + "_" + userProfile.getOriginalFilename();

				user.setUserProfileName(fileName);

				String savePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");

				userProfile.transferTo(new File(savePath + fileName));

			}
		}

		user.setUserPw(pwEnc.encode(user.getUserPw()));

		int result = dao.memberModifyProcess(user);

		if (result > 0) {
			mav.setViewName("redirect:/memberMyView?userId=" + user.getUserId());
		} else {
			mav.setViewName("redirect:/index");
		}

		return mav;
	}

	public ModelAndView bookList(String userId, int page, int limit) {

		ALL all = new ALL();

		int block = 5;
		int bCount = dao.mybookCount(userId);

		int maxPage = (int) (Math.ceil((double) bCount / limit));
		int startPage = ((int) (Math.ceil((double) page / block)) - 1) * block + 1;
		int endPage = startPage + block - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		if (page > endPage) {
			page = endPage;
		}

		// page값을 변경한 후에 아래 변수를 선언합니다.
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		all.setPage(page);
		all.setStartRow(startRow);
		all.setEndRow(endRow);
		all.setMaxPage(maxPage);
		all.setStartPage(startPage);
		all.setEndPage(endPage);
		all.setLimit(limit);
		all.setUserId(userId);

		List<ALL> bookList = dao.bookList(all);

		mav.addObject("paging", all);
		mav.addObject("bookList", bookList);
		mav.setViewName("mybookList");

		return mav;
	}

}
