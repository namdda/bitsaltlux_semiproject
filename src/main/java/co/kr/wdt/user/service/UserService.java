package co.kr.wdt.user.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.kr.wdt.user.vo.UserVo;

public interface UserService {

	public int checkExistid(String inputId);

	public void joinProc(UserVo userVo, MultipartHttpServletRequest request);

	public UserVo userUpdate(String inputId);

	public void updateProc(UserVo userVo);

	public void deleteProc(UserVo userVo);
}
