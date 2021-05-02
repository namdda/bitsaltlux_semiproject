package co.kr.wdt.common.vo;

import java.io.Serializable;

public class MajorVo implements Serializable {

	private static final long serialVersionUID = -330156917321443646L;

	private String idx;
	private String name;
	private String type;
	private String value;

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "MajorVo [idx=" + idx + ", name=" + name + ", type=" + type + ", value=" + value + "]";
	}

}
