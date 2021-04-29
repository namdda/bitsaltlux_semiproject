package co.kr.wdt.user.vo;

import java.io.Serializable;

public class UserVo implements Serializable {

	private static final long serialVersionUID = 4416395267322236377L;

	private int no = 0;
	private String inputName;
	private String inputSchool;
	private int inputId = 0;
	private String inputMajor;
	private String userPw;
	private String level;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public String getInputSchool() {
		return inputSchool;
	}

	public void setInputSchool(String inputSchool) {
		this.inputSchool = inputSchool;
	}

	public int getInputId() {
		return inputId;
	}

	public void setInputId(int inputId) {
		this.inputId = inputId;
	}

	public String getInputMajor() {
		return inputMajor;
	}

	public void setInputMajor(String inputMajor) {
		this.inputMajor = inputMajor;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "UserVo [no=" + no + ", inputName=" + inputName + ", inputSchool=" + inputSchool + ", inputId=" + inputId
				+ ", inputMajor=" + inputMajor + ", userPw=" + userPw + ", level=" + level + "]";
	}

}