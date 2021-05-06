package co.kr.wdt.post.vo;

public class PostVo {

	private Long no;
	private String title;
	private String author;
	private String content;
	private String originFile;
	private String storedFile;
	private String wDate;
	private int blogId;
	
	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public String getOriginFile() {
		return originFile;
	}

	public void setOriginFile(String originFile) {
		this.originFile = originFile;
	}

	public String getStoredFile() {
		return storedFile;
	}

	public void setStoredFile(String storedFile) {
		this.storedFile = storedFile;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	@Override
	public String toString() {
		return "PostVo [no=" + no + ", title=" + title + ", author=" + author + ", content=" + content + ", originFile="
				+ originFile + ", storedFile=" + storedFile + ", wDate=" + wDate + ", blogId=" + blogId + "]";
	}
	

	
	
}
