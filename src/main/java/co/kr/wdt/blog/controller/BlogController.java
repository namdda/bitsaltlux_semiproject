package co.kr.wdt.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.kr.wdt.blog.service.BlogService;
import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.user.vo.UserVo;

@Controller
@RequestMapping("/blog/{id}")
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/blogMain.do")
	public String index(@PathVariable("id") String id) {
		int user_id = Integer.parseInt(id);
		BlogVo blogVo = blogService.findMyBlog(user_id);
		
		
		if(blogVo == null) {
			return "blog/join";
		}
		
		return "redirect:/blog/{id}/post/mainPage.do";
	}
	
	@RequestMapping(value="/joinBlog.do", method=RequestMethod.POST)
	public String join(BlogVo vo, @RequestParam("file") MultipartFile file) {
//		List<String> path = fileUploadService.uploadLogo(file, uploadPath);
		vo.setO_logo("");
		vo.setT_logo("");
		blogService.join(vo);
		return "redirect:/blog/{id}/post/mainPage.do";
	}
	
}
