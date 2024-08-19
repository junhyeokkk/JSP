package com.board.service;

import java.util.List;

import com.board.DTO.userDTO;
import com.board.util.DBHelper;
import com.jboard.DAO.userDAO;

public enum userService{

	INSTANCE;
	
	private userDAO dao = userDAO.getInstance();
	
	public void insertUser(userDTO dto) {
		dao.insertUser(dto);
	};
	public void selectUser(String uid) {
		
	};
	public List<userDTO> selectUsers() {
		return null;
	};
	public void updateUser(userDTO dto) {
		
	};
	public void deleteUser(String uid) {
		
	};
}
