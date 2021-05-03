package co.kr.wdt.subject.vo;

import java.io.Serializable;

public class SubjectVo implements Serializable {

	private static final long serialVersionUID = 8226402775993802868L;

	private String idx;
	private String name;
	private String userId;
	private String subjects;
	private String time;
	private String grades;
	private String inputName;
	private String allTypeName;
	private String etc;
	private String cnt;
	private String rowidx;

	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getGrades() {
		return grades;
	}
	public void setGrades(String grades) {
		this.grades = grades;
	}
	public String getInputName() {
		return inputName;
	}
	public void setInputName(String inputName) {
		this.inputName = inputName;
	}
	public String getAllTypeName() {
		return allTypeName;
	}
	public void setAllTypeName(String allTypeName) {
		this.allTypeName = allTypeName;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getRowidx() {
		return rowidx;
	}
	public void setRowidx(String rowidx) {
		this.rowidx = rowidx;
	}
	@Override
	public String toString() {
		return "SubjectVo [idx=" + idx + ", name=" + name + ", userId=" + userId + ", subjects=" + subjects + ", time="
				+ time + ", grades=" + grades + ", inputName=" + inputName + ", allTypeName=" + allTypeName + ", etc="
				+ etc + ", cnt=" + cnt + ", rowidx=" + rowidx + "]";
	}
}