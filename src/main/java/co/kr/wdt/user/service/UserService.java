package co.kr.wdt.user.service;

import co.kr.wdt.user.vo.UserVo;

public interface UserService {

	public int checkExistid(String inputId);

	public void joinProc(UserVo userVo);

	public UserVo userUpdate(String inputId);

	public void updateProc(UserVo userVo);

	public void deleteProc(UserVo userVo);
}
