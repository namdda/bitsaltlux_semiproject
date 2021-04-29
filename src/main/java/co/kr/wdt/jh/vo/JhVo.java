package co.kr.wdt.jh.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class JhVo implements Serializable {

	private static final long serialVersionUID = -98705423249942516L;


	private String userId;
	private String userPw;
	private String userName;
	private String userNm;

}
