package co.kr.wdt.blog.vo;

public class BlogVo {

	private Long no;
	private int userId;
	private String userName;
	private String originLogo;
	private String thumbLogo;
	private String intro;
	private String regDate;
	
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	private int curPage;
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
		return "BlogVo [no=" + no + ", userId=" + userId + ", userName=" + userName + ", originLogo=" + originLogo
				+ ", thumbLogo=" + thumbLogo + ", intro=" + intro + ", regDate=" + regDate + ", keyword=" + keyword
				+ ", curPage=" + curPage + "]";
	}

}
