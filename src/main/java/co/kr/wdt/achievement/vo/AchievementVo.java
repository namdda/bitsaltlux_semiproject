package co.kr.wdt.achievement.vo;

public class AchievementVo {
	private int no;
	private int todono;
	private String successdate;
	private int issuccess;
	
	public AchievementVo() {
		super();
	}
	public AchievementVo(int no, int todono, String successdate, int issuccess) {
		super();
		this.no = no;
		this.todono = todono;
		this.successdate = successdate;
		this.issuccess = issuccess;
	}

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getTodono() {
		return todono;
	}


	public void setTodono(int todono) {
		this.todono = todono;
	}


	public String getSuccessdate() {
		return successdate;
	}


	public void setSuccessdate(String successdate) {
		this.successdate = successdate;
	}


	public int getIssuccess() {
		return issuccess;
	}
	public void setIssuccess(int issuccess) {
		this.issuccess = issuccess;
	}
	
	@Override
	public String toString() {
		return "AchievementVo [no=" + no + ", todono=" + todono + ", successdate=" + successdate + ", issuccess="
				+ issuccess + "]";
	}
}
