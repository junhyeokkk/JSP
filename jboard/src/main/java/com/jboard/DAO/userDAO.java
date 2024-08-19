package com.jboard.DAO;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.board.DTO.userDTO;
import com.board.util.DBHelper;
import com.board.util.SQL;

public class userDAO extends DBHelper{
	
	private static userDAO instance = new userDAO();
	public static userDAO getInstance() {
		return instance;
	}
	private userDAO() {};
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(userDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegip());
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
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
