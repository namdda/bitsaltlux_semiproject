package co.kr.wdt.courseevaluationboard.vo;

public class CourseEvaluationBoardVo {
	private int boardIdx; 		 //	BOARD_IDX
	private int courseIdx;		 //	COURSE_IDX
	private String title;		 //	TITLE
	private String content;		 //	CONTENT
	private String userName;	 //	USER_NAME
	private String courseName;	 //	COURSE_NAME
	private long userIdx;		 //	USER_IDX
	private int hitCnt;			 //	HIT_CNT
	private String regDate;		 //	REG_DATE
	private String delGb;		 //	DEL_GB
	
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getCourseIdx() {
		return courseIdx;
	}
	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public long getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(long userIdx) {
		this.userIdx = userIdx;
	}
	public int getHitCnt() {
		return hitCnt;
	}
	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getDelGb() {
		return delGb;
	}
	public void setDelGb(String delGb) {
		this.delGb = delGb;
	}
	
	@Override
	public String toString() {
		return "CourseEvaluationBoardVo [boardIdx=" + boardIdx + ", courseIdx=" + courseIdx + ", title=" + title
				+ ", content=" + content + ", userName=" + userName + ", courseName=" + courseName + ", userIdx="
				+ userIdx + ", hitCnt=" + hitCnt + ", regDate=" + regDate + ", delGb=" + delGb + "]";
	}
}
