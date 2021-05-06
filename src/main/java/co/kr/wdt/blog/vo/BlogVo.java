package co.kr.wdt.blog.vo;

public class BlogVo {

	private Long no;
	private int userId;
	private String originLogo;
	private String thumbLogo;
	private String intro;
	private String regDate;
	
	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getOriginLogo() {
		return originLogo;
	}

	public void setOriginLogo(String originLogo) {
		this.originLogo = originLogo;
	}

	public String getThumbLogo() {
		return thumbLogo;
	}

	public void setThumbLogo(String thumbLogo) {
		this.thumbLogo = thumbLogo;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BlogVo [no=" + no + ", userId=" + userId + ", originLogo=" + originLogo + ", thumbLogo=" + thumbLogo
				+ ", intro=" + intro + ", regDate=" + regDate + "]";
	}

	
	
}
