package co.kr.wdt.common.vo;

import java.io.Serializable;

public class ProfessorVo implements Serializable {

	private static final long serialVersionUID = 2376645969133044634L;

	private String inputName;
	private String subjects;
	private String inputId;

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public String getSubjects() {
		return subjects;
	}

	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	public String getInputId() {
		return inputId;
	}

	public void setInputId(String inputId) {
		this.inputId = inputId;
	}

	@Override
	public String toString() {
		return "ProfessorVo [inputName=" + inputName + ", subjects=" + subjects + ", inputId=" + inputId + "]";
	}
}
