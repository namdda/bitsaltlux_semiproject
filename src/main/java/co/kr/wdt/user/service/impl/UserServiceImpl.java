package co.kr.wdt.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.user.dao.UserDao;
import co.kr.wdt.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public int checkExistid(String inputId) {
		return userDao.checkExistid(inputId);
	}

}
