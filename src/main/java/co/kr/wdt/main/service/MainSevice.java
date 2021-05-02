package co.kr.wdt.main.service;

import java.util.List;

import co.kr.wdt.common.vo.AllTypeVo;
import co.kr.wdt.common.vo.MajorVo;
import co.kr.wdt.common.vo.ProfessorVo;

public interface MainSevice {

	public List<MajorVo> selectMajorList();

	public List<AllTypeVo> allTypeList(String value);

	public List<ProfessorVo> professorList(String value);

}
