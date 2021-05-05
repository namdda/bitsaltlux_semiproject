package co.kr.wdt.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/mainPage.do")
	public String index(Model model) {
		List<BlogVo> blogVo = blogService.findAllBlog();
		model.addAttribute("blogVo", blogVo);
		return "blog/index";
	}
	
	@RequestMapping("/{id}/blogMain.do")
	public String index(@ModelAttribute("id") @PathVariable("id") int id) {
		BlogVo blogVo = blogService.findMyBlog(id);
		
		if(blogVo == null) {
			return "blog/join";
		}
		
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	@RequestMapping(value="/{id}/joinProc.do", method=RequestMethod.POST)
	public String join(BlogVo vo) {
//		List<String> path = fileUploadService.uploadLogo(file, uploadPath);
		vo.setOriginLogo(null);
		vo.setThumbLogo(null);
		blogService.join(vo);
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	@RequestMapping(value="/{id}/update.do", method=RequestMethod.GET)
	public String update(@PathVariable("id") int id, Model model) {
		BlogVo blogVo = blogService.findMyBlog(id);
		model.addAttribute("blogVo", blogVo);
		return "blog/update";
	}
	
	@RequestMapping(value="/{id}/updateProc.do", method=RequestMethod.POST)
	public String update(BlogVo blogVo, @PathVariable("id") int id) {
		blogVo.setOriginLogo(null);
		blogVo.setThumbLogo(null);
		blogService.update(blogVo);
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	@RequestMapping("/{id}/delete.do")
	public String delete(@PathVariable("id") int id, @RequestParam("result") String result) {
		if(result.equals("true")) {
//			BlogVo blogVo = blogService.findMyBlog(id);
//			fileUploadService.blogDelete(blogVo, uploadPath);
			blogService.delete(id);
		}
		return "redirect:/blog/{id}/blogMain.do";
	}
	
}
