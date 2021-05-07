package co.kr.wdt.courseevaluationmanagement.dto;

public class CategoryResult {
	private String result;
	private Object data;
	private String message;
	
	private CategoryResult() { }
	
	private CategoryResult(Object data) {
		this.result = "success";
		this.data = data;
	}
	
	private CategoryResult(String message) {
		this.result = "fail";
		this.message = message;
	}
	
	
	public static CategoryResult success(Object data) {
		return new CategoryResult(data);
	}
	
	public static CategoryResult fail(String message) {
		return new CategoryResult(message);
	}
		
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "CategoryResult [result=" + result + ", data=" + data + ", message=" + message + "]";
	}
	
}
