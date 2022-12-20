package com.icia.smtp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.smtp.dto.BOOK;
import com.icia.smtp.dto.CINEMA;
import com.icia.smtp.dto.MOVIE;
import com.icia.smtp.dto.TICKET;

@Repository
public class BODAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int tiBook(BOOK book) {
		
		return sql.insert("Book.tiBook", book);
	}

	public TICKET ticket(BOOK book) {
		
		return sql.selectOne("Book.ticket", book);
	}

	public void update(TICKET ticket) {
		sql.update("Book.mvat",ticket.getTicTitle());
		sql.update("Book.tiseat",ticket.getTicNum());
		
	}
	// 예매 취소 메소드
		public int deletebookList(String bookNum) {
				sql.update("Book.mvat",bookNum);
				sql.update("Book.tiseat",bookNum);
			return sql.delete("Book.bookDelete", bookNum);
		}

		

		
	
	
	
}
