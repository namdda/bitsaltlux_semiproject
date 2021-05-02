package co.kr.wdt.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.user.dao.UserDao;
import co.kr.wdt.user.service.UserService;
import co.kr.wdt.user.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public int checkExistid(String inputId) {
		return userDao.checkExistid(inputId);
	}

	@Override
	public void joinProc(UserVo userVo) {
//		if("STUDENT".equals(userVo.getLevel())) userDao.joinProc(userVo);
//		else userDao.joinProc(userVo);
		userDao.joinProc(userVo);
	}

	@Override
	public UserVo userUpdate(String inputId) {
		return userDao.userUpdate(inputId);
	}

	@Override
	public void updateProc(UserVo userVo) {
		userDao.updateProc(userVo);
	}

	@Override
	public void deleteProc(UserVo userVo) {
		userDao.deleteProc(userVo);
	}
}
