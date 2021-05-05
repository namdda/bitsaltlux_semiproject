package co.kr.wdt.main.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.wdt.common.vo.AllTypeVo;
import co.kr.wdt.common.vo.MajorVo;
import co.kr.wdt.common.vo.ProfessorVo;
import co.kr.wdt.main.service.MainSevice;

@Controller
@RequestMapping(value="/main")
public class MainController {

	@Autowired
	private MainSevice mainService;
	
	@Autowired
	private String uploadPath;

	@RequestMapping(value="/mainPage.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainPage(HttpServletRequest request, Model model) {
		List<MajorVo> majorVo = mainService.selectMajorList();
		String redirectUrl = "main/mainPage";
		HttpSession session = request.getSession(false);
		if(session == null) {
			redirectUrl ="redirect:/login/loginPage.do?Status=SESSIONOUT";
		} else {
			if(session.getAttribute("userId") == null) redirectUrl ="redirect:/login/loginPage.do?Status=SESSIONOUT";
			// if("PRO".equals(session.getAttribute("level"))) redirectUrl = "main/proMainPage";
		}
		model.addAttribute("majorList", majorVo);
		return redirectUrl;
	}

	@RequestMapping(value="/allTypeList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<AllTypeVo> allTypeList(String value) {
		List<AllTypeVo> allTypeVo = mainService.allTypeList(value);
		return allTypeVo;
	}

	@RequestMapping(value="/professorList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ProfessorVo> professorList(String value) {
		List<ProfessorVo> professorVo = mainService.professorList(value);
		return professorVo;
	}
	
	@RequestMapping(value="/profile.do", method=RequestMethod.GET)	
	public ResponseEntity<byte[]> profile(String fileName, HttpServletRequest request) throws Exception {
		InputStream in = null;		// java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// 헤더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			// InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
			fileName = fileName.substring(fileName.indexOf("_") + 1);
			// 다운로드용 컨텐츠 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			String header = request.getHeader("User-Agent");

			// 익스플로러 11버전(IE11)부터 브라우져의 식별 문자가 MSIE에서 Trident로 변경되었다.
			// 구버전(IE10,9,8)과 신버전(IE11)을 둘다 지원해주기 위해 다음과 같이 변경해준다.
			if (header.contains("MSIE") || header.contains("Trident")) { //IE 11버전부터 Trident로 변경되었기때문에 추가해준다.
				fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
				headers.add("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
			}else{
				// 큰 따옴표 내부에 " \" " 사용하기 위한거
				// 바이트배열을 스트링으로
				// iso-8859-1 서유럽언어
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "iso-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();	// 스트림 닫기
		}
		return entity;
	}
}
