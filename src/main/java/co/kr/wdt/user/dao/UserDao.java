package co.kr.wdt.user.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;

@Repository
public class UserDao extends CommonSqlDao2 {
	
	private static String PREFIX = "UserMapper.";

	public int checkExistid(String inputId) {
		return (int) selectOne(PREFIX + "checkExistid", inputId);
	}

}
