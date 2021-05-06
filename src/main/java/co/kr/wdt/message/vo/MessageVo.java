package co.kr.wdt.message.vo;

public class MessageVo {
	
	private Long no;
	private String toName;
	private String content;
	private String fromName;
	private int userTo;		// 받는 사람
	private int userFrom;	// 보내는 사람
	private String sendDate;
	private int userId;
	
	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}
	
	public String getToName() {
		return toName;
	}
	
	public void setToName(String toName) {
		this.toName = toName;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getFromName() {
		return fromName;
	}
	
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	
	public int getUserTo() {
		return userTo;
	}
	
	public void setUserTo(int userTo) {
		this.userTo = userTo;
	}
	
	public int getUserFrom() {
		return userFrom;
	}
	
	public void setUserFrom(int userFrom) {
		this.userFrom = userFrom;
	}
	
	public String getSendDate() {
		return sendDate;
	}
	
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "MessageVo [no=" + no + ", toName=" + toName + ", content=" + content + ", fromName=" + fromName
				+ ", userTo=" + userTo + ", userFrom=" + userFrom + ", sendDate=" + sendDate + ", userId=" + userId
				+ "]";
	}
	
	

}
