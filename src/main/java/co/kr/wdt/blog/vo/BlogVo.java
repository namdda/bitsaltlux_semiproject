package co.kr.wdt.blog.vo;

public class BlogVo {

	private Long no;
	private int user_id;
	private String o_logo;
	private String t_logo;
	private String intro;
	private String reg_date;
	
	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getO_logo() {
		return o_logo;
	}
	
	public void setO_logo(String o_logo) {
		this.o_logo = o_logo;
	}
	
	public String getT_logo() {
		return t_logo;
	}
	
	public void setT_logo(String t_logo) {
		this.t_logo = t_logo;
	}
	
	public String getIntro() {
		return intro;
	}
	
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "BlogVo [no=" + no + ", user_id=" + user_id + ", o_logo=" + o_logo + ", t_logo=" + t_logo + ", intro="
				+ intro + ", reg_date=" + reg_date + "]";
	}
	
	
	
	
}
