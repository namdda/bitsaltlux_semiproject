package co.kr.wdt.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.login.dao.LoginDao;
import co.kr.wdt.login.service.LoginService;
import co.kr.wdt.user.vo.UserVo;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;
	@Override
	public UserVo loginProc(String inputId) {
		return loginDao.loginProc(inputId);
	}

}
