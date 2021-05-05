package co.kr.wdt.comment.vo;

public class CommentVo {

	
	private Long no;
	private String writer;
	private String content;
	private String wDate;
	private Long postNo;
	
	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public Long getPostNo() {
		return postNo;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "CommentVo [no=" + no + ", writer=" + writer + ", content=" + content + ", wDate=" + wDate + ", postNo="
				+ postNo + ", getNo()=" + getNo() + ", getWriter()=" + getWriter() + ", getContent()=" + getContent()
				+ ", getwDate()=" + getwDate() + ", getPostNo()=" + getPostNo() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	
	
	
	
	
}
