package com.board.service;

import com.board.DTO.terms.termsDTO;
import com.board.util.DBHelper;
import com.jboard.DAO.termsDAO;

public enum termsService{

	INSTANCE;
	
	private termsDAO dao = termsDAO.getInstance();
	
	// CRUD메서드
		public termsDTO selectTerms() {
			
			return dao.selectTerms();
		}
}
