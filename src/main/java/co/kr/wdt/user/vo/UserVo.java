package co.kr.wdt.user.vo;

import java.io.Serializable;

public class UserVo implements Serializable {

	private static final long serialVersionUID = 4416395267322236377L;

	private int no;
	private String inputName;
	private String inputSchool;
	private int inputId = 0; // 학번
	private String inputMajor;
	private String userPw;
	private String level;
	private String subjects;

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

	public String getSubjects() {
		return subjects;
	}

	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	@Override
	public String toString() {
		return "UserVo [no=" + no + ", inputName=" + inputName + ", inputSchool=" + inputSchool + ", inputId=" + inputId
				+ ", inputMajor=" + inputMajor + ", userPw=" + userPw + ", level=" + level + ", subjects=" + subjects
				+ "]";
	}

}