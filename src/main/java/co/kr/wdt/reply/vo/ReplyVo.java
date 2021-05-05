package co.kr.wdt.reply.vo;

public class ReplyVo {

	private Long no;
	private String writer;
	private String content;
	private String regDate;
	private Long commentNo;
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
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public Long getCommentNo() {
		return commentNo;
	}
	
	public void setCommentNo(Long commentNo) {
		this.commentNo = commentNo;
	}
	
	public Long getPostNo() {
		return postNo;
	}
	
	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}
	
	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", writer=" + writer + ", content=" + content + ", regDate=" + regDate
				+ ", commentNo=" + commentNo + ", postNo=" + postNo + "]";
	}

	
	
	
	
}
