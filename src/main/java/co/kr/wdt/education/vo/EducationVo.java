package co.kr.wdt.education.vo;

import java.io.Serializable;

public class EducationVo implements Serializable {

	private static final long serialVersionUID = -5097434370988343670L;

	private int idx;
	private int no;
	private String name;
	private String allTypeName;
	private String time;
	private String firstSubject;
	private String secondSubject;
	private String subjects;
	private String grades;
	private String inputName;
	private String etc;
	private String cnt;
	private String inputId;
	private String idx1;
	private String idx2;
	private String time1;
	private String time2;
	private String type;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAllTypeName() {
		return allTypeName;
	}
	public void setAllTypeName(String allTypeName) {
		this.allTypeName = allTypeName;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getFirstSubject() {
		return firstSubject;
	}
	public void setFirstSubject(String firstSubject) {
		this.firstSubject = firstSubject;
	}
	public String getSecondSubject() {
		return secondSubject;
	}
	public void setSecondSubject(String secondSubject) {
		this.secondSubject = secondSubject;
	}
	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
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
	public String getInputId() {
		return inputId;
	}
	public void setInputId(String inputId) {
		this.inputId = inputId;
	}
	public String getIdx1() {
		return idx1;
	}
	public void setIdx1(String idx1) {
		this.idx1 = idx1;
	}
	public String getIdx2() {
		return idx2;
	}
	public void setIdx2(String idx2) {
		this.idx2 = idx2;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "EducationVo [idx=" + idx + ", no=" + no + ", name=" + name + ", allTypeName=" + allTypeName + ", time="
				+ time + ", firstSubject=" + firstSubject + ", secondSubject=" + secondSubject + ", subjects="
				+ subjects + ", grades=" + grades + ", inputName=" + inputName + ", etc=" + etc + ", cnt=" + cnt
				+ ", inputId=" + inputId + ", idx1=" + idx1 + ", idx2=" + idx2 + ", time1=" + time1 + ", time2=" + time2
				+ ", type=" + type + "]";
	}
}
