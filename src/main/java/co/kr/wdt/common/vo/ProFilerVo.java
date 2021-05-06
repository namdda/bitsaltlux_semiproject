package co.kr.wdt.common.vo;

import java.io.Serializable;

public class ProFilerVo implements Serializable {

	private static final long serialVersionUID = -7113034456220427515L;

	private int userNo;
	private String userNm;
	private String inputSchool;
	private int userId;
	private String inputMajor;
	private String userPw;
	private String userLevel;
	private String regDate;
	private String subjects;
	private String fullName;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getInputSchool() {
		return inputSchool;
	}
	public void setInputSchool(String inputSchool) {
		this.inputSchool = inputSchool;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	@Override
	public String toString() {
		return "ProFilerVo [userNo=" + userNo + ", userNm=" + userNm + ", inputSchool=" + inputSchool + ", userId="
				+ userId + ", inputMajor=" + inputMajor + ", userPw=" + userPw + ", userLevel=" + userLevel
				+ ", regDate=" + regDate + ", subjects=" + subjects + ", fullName=" + fullName + "]";
	}
}
