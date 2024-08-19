package com.board.util;

public class SQL {
	
	public static final String SELECT_TERMS = "select * from terms";
	public static final String INSERT_USER = "insert into user set "
											+ "`uid` = ?, "
											+ "`pass` = ?, "
											+ "`name` = ?, "
											+ "`nick` = ?, "
											+ "`email` = ?, "
											+ "`hp` = ?, "
											+ "`zip` = ?, "
											+ "`addr1` = ?, "
											+ "`addr2` = ?, "
											+ "`regip` = ?, "
											+ "`regDate` = NOW()";
}
