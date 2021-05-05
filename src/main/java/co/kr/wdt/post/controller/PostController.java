package co.kr.wdt.post.controller;

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
		
		/*
		 * 아래 코드에서 두 vo 출력 시 member 테이블에서 참조한 user_id(blogVo) / blog_id(postVo)가 모두 0으로 나옴
		 * 그래서 jsp에서는 model 어트리뷰트에 설정한 vo를 사용하지 못하고
		 * sessionScope.userId 혹은 @PathVariable로 참조한 id를 사용중임
		 */
		BlogVo blogVo = blogService.findMyBlog(id);			
	 	List<PostVo> postVo = postService.findAllPost(id);
	 	
	 	

//	 	if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
//			return "redirect:/{id}/post";
//		}
		
		model.addAttribute("blogVo", blogVo);
		model.addAttribute("postVo", postVo);
//		model.addAttribute("pageVo", pageVo);
		model.addAttribute("id", id);

		return "post/index";
	}
	
	@RequestMapping(value="/addProc.do", method=RequestMethod.GET)
	public String postAdd(@ModelAttribute("id") int id) {
		return "post/add";
	}
	
	@RequestMapping(value="/addProc.do", method=RequestMethod.POST)
	public String postAdd(PostVo vo) {
		postService.insert(vo);
		return "redirect:/blog/{id}/post/mainPage.do";
	}
	
	@RequestMapping("/{no}/viewPage.do")
	public String view(@PathVariable("no") Long no, @PathVariable("id") String id, Model model) {
		PostVo postVo = postService.findByNo(no);
//		List<CommentVo> commentVo = commentService.findAllComment(no);
//		List<ReplyVo> replyVo = replyService.findAllReply(no);
		model.addAttribute("postVo", postVo);
		model.addAttribute("no", no);
		model.addAttribute("id", id);
//		model.addAttribute("commentVo", commentVo);
//		model.addAttribute("replyVo", replyVo);
		return "post/view";
	}

}
