package co.kr.wdt.courseevaluationmanagement.vo;

public class CourseCategoryVo {
	private String courseCode; 		//	COURSE_CODE
	private String courseCateName;		//	COURSE_CATE_NAME
	private String courseCodeRef;	//	COURSE_CODE_REF
	
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getCourseCateName() {
		return courseCateName;
	}
	public void setCourseCateName(String courseCateName) {
		this.courseCateName = courseCateName;
	}
	public String getCourseCodeRef() {
		return courseCodeRef;
	}
	public void setCourseCodeRef(String courseCodeRef) {
		this.courseCodeRef = courseCodeRef;
	}
	
	@Override
	public String toString() {
		return "CourseCategoryVo [courseCode=" + courseCode + ", courseCateName=" + courseCateName + ", courseCodeRef="
				+ courseCodeRef + "]";
	}
	
}
