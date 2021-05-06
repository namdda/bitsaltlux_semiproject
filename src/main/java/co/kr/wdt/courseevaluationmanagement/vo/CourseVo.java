package co.kr.wdt.courseevaluationmanagement.vo;

public class CourseVo {
	private int courseIdx;				//	COURSE_IDX
	private String courseName;			//	COURSE_NAME
	private String courseCode;			//	COURSE_CODE
//	private int mvPrice;				//	(delete)
	private int particiNum;	 			//	PARTICI_NUM
	private String courseDes;			//	COURSE_DES
	private String hitCnt;				//	HIT_CNT
	private String regDate;				//	REG_DATE
//	private String mvImg;
	
	private String originalFileName;	//	ORIGINAL_FILE_NAME
	private String storedFileName;		//	STORED_FILE_NAME
	
	public int getCourseIdx() {
		return courseIdx;
	}
	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public int getParticiNum() {
		return particiNum;
	}
	public void setParticiNum(int particiNum) {
		this.particiNum = particiNum;
	}
	public String getCourseDes() {
		return courseDes;
	}
	public void setCourseDes(String courseDes) {
		this.courseDes = courseDes;
	}
	public String getHitCnt() {
		return hitCnt;
	}
	public void setHitCnt(String hitCnt) {
		this.hitCnt = hitCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	
	@Override
	public String toString() {
		return "CourseVo [courseIdx=" + courseIdx + ", courseName=" + courseName + ", courseCode=" + courseCode
				+ ", particiNum=" + particiNum + ", courseDes=" + courseDes + ", hitCnt=" + hitCnt + ", regDate="
				+ regDate + ", originalFileName=" + originalFileName + ", storedFileName=" + storedFileName + "]";
	}
	

}
