package co.kr.wdt.todo.vo;

public class TodoVo {
	private int no;
	private int userno;
	private String category;
	private String title; 
	private String description;
	private String startdate;
	private String duedate;
	
	private int issuccess;
	
	
	
	public TodoVo() {
		super();
	}
	public TodoVo(int no, int userno, String category, String title, String description, String startdate, String duedate) {
		super();
		this.no = no;
		this.userno = userno;
		this.category = category;
		this.title = title;
		this.description = description;
		this.startdate = startdate;
		this.duedate = duedate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getDuedate() {
		return duedate;
	}
	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}
	
	
	public int getIssuccess() {
		return issuccess;
	}
	public void setIssuccess(int issuccess) {
		this.issuccess = issuccess;
	}
	@Override
	public String toString() {
		return "TodoVo [no=" + no + ", userno=" + userno + ", category=" + category + ", title=" + title
				+ ", description=" + description + ", startdate=" + startdate + ", duedate=" + duedate + ", issuccess="
				+ issuccess + "]";
	}
	

}
