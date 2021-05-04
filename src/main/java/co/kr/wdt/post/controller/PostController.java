package co.kr.wdt.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.wdt.blog.service.BlogService;
import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.post.service.PostService;
import co.kr.wdt.post.vo.PostVo;

@Controller
@RequestMapping("/blog/{id}/post")
public class PostController {
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private PostService postService;
	
	
	@RequestMapping("/mainPage.do")
	public String index(Model model, @PathVariable("id") int id, @RequestParam(value="page", required=false) String pageNum) {
//		PageVo pageVo = new PageVo(pageNum, postService.getCount(id), 5);
		System.out.println(id);
	 	List<PostVo> postVo = postService.findAllPost(id);
	 	System.out.println(postVo);
	 	BlogVo blogVo = blogService.findMyBlog(id);
	 	
//	 	if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
//			return "redirect:/{id}/post";
//		}
		
		model.addAttribute("blogVo", blogVo);
		model.addAttribute("postVo", postVo);
//		model.addAttribute("pageVo", pageVo);
		model.addAttribute("id", id);

		return "post/index";
	}

}
