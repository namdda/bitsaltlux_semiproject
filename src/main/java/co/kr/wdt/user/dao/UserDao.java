package co.kr.wdt.user.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.user.vo.UserVo;

@Repository
public class UserDao extends CommonSqlDao2 {

	private static String PREFIX = "UserMapper.";

	public int checkExistid(String inputId) {
		return (int) selectOne(PREFIX + "checkExistid", inputId);
	}

	public int joinProc(UserVo userVo) {
		return (int) insert (PREFIX + "joinProc", userVo);
	}

	public UserVo userUpdate(String inputId) {
		return (UserVo) selectOne(PREFIX + "userUpdate", inputId);
	}

	public void updateProc(UserVo userVo) {
		update(PREFIX + "updateProc", userVo);
	}

	public void deleteProc(UserVo userVo) {
		delete(PREFIX + "deleteProc", userVo);
	}

	public void imageUserInsert(UserVo userVo) {
		insert(PREFIX + "imageUserInsert", userVo);
	}

	public int maxNo() {
		return (int) selectOne(PREFIX + "maxNo");
	}

	public String selectUserProfileFullName(int no) {
		return (String)selectOne(PREFIX + "selectUserProfileFullName", no);
		//아니 이거 자체는 문제가 있는 듯? 저거인가? 나는 저 "no"가 뭔지 모른다 
	}
	
	public void imageDelete(int no) {
		delete(PREFIX +"imageDelete", no);
	}

}
