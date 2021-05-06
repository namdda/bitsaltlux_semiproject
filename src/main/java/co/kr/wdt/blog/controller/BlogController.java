package co.kr.wdt.blog.controller;

import java.util.List;

import javax.annotation.Resource;

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
import co.kr.wdt.common.service.FileUploadService;
import co.kr.wdt.common.vo.BlogPageVo;
import co.kr.wdt.post.vo.PostVo;
import co.kr.wdt.security.Auth;

@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping("/mainPage.do")
	public String index(Model model, @RequestParam(value="page", required=false) String pageNum) {
		BlogPageVo pageVo = new BlogPageVo(pageNum, blogService.getCount(), 3);
		List<BlogVo> blogVo = blogService.findAllBlog(pageVo.getCurPage());
		
		if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
			return "redirect:/blog/mainPage.do";
		}
		
		model.addAttribute("blogVo", blogVo);
		model.addAttribute("pageVo", pageVo);
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
	
	@RequestMapping("/searchProc.do")
	public String search(@RequestParam(value="keyword", required=false) String keyword, Model model, @RequestParam(value="page", required=false) String pageNum) {
		int postCount = blogService.findPostByKeyword(keyword);
		BlogPageVo pageVo = new BlogPageVo(pageNum, postCount, 5);
		List<PostVo> postVo = blogService.findByKeyword(keyword, pageVo.getCurPage());
		
		model.addAttribute("postCount", postCount);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("postVo", postVo);
		model.addAttribute("keyword", keyword);
		
		return "blog/search";
	}
	
	@Auth
	@RequestMapping(value="/{id}/joinProc.do", method=RequestMethod.POST)
	public String join(BlogVo blogVo, @RequestParam("file") MultipartFile file) {
		if(file.isEmpty()) {
			blogVo.setOriginLogo(null);
			blogVo.setThumbLogo(null);
		} else {
			List<String> path = fileUploadService.uploadLogo(file, uploadPath);
			blogVo.setOriginLogo(path.get(0));
			blogVo.setThumbLogo(path.get(1));
		}
		
		blogService.join(blogVo);
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	@Auth
	@RequestMapping(value="/{id}/update.do", method=RequestMethod.GET)
	public String update(@PathVariable("id") int id, Model model) {
		BlogVo blogVo = blogService.findMyBlog(id);
		model.addAttribute("blogVo", blogVo);
		return "blog/update";
	}
	
	@Auth
	@RequestMapping(value="/{id}/updateProc.do", method=RequestMethod.POST)
	public String update(BlogVo blogVo, @PathVariable("id") int id, @RequestParam("file") MultipartFile file) {
		if(file.isEmpty()) {
			if(blogVo.getOriginLogo() != null ) {
				fileUploadService.blogDelete(blogVo, uploadPath);
			}
			blogVo.setOriginLogo(null);
			blogVo.setThumbLogo(null);
		} else {
			blogVo = blogService.findMyBlog(id);
			
			if(!blogVo.getOriginLogo().isEmpty() ) {
				fileUploadService.blogDelete(blogVo, uploadPath);
			}
			
			List<String> list = fileUploadService.uploadLogo(file, uploadPath);
			blogVo.setOriginLogo(list.get(0));
			blogVo.setThumbLogo(list.get(1));
		}
		
		blogService.update(blogVo);
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	@Auth
	@RequestMapping("/{id}/delete.do")
	public String delete(@PathVariable("id") int id, @RequestParam("result") String result) {
		if(result.equals("true")) {
			BlogVo blogVo = blogService.findMyBlog(id);
			fileUploadService.blogDelete(blogVo, uploadPath);
			blogService.delete(id);
		}
		return "redirect:/blog/{id}/blogMain.do";
	}
	
}