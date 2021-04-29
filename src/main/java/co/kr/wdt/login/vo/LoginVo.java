package co.kr.wdt.login.vo;

import java.io.Serializable;

public class LoginVo implements Serializable {

	private static final long serialVersionUID = -2295537769746198719L;

	private String inputId;
	private String userPw;

	public String getInputId() {
		return inputId;
	}

	public void setInputId(String inputId) {
		this.inputId = inputId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	@Override
	public String toString() {
		return "LoginVo [inputId=" + inputId + ", userPw=" + userPw + "]";
	}

}
