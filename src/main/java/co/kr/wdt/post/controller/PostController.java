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
import co.kr.wdt.comment.service.CommentService;
import co.kr.wdt.comment.vo.CommentVo;
import co.kr.wdt.post.service.PostService;
import co.kr.wdt.post.vo.PostVo;
import co.kr.wdt.reply.service.ReplyService;
import co.kr.wdt.reply.vo.ReplyVo;

@Controller
@RequestMapping("/blog/{id}")
public class PostController {
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ReplyService replyService;
	

	@RequestMapping("/mainPage.do")
	public String index(Model model, @PathVariable("id") int id, @RequestParam(value="page", required=false) String pageNum) {
//		PageVo pageVo = new PageVo(pageNum, postService.getCount(id), 5);
		
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
	
	@RequestMapping(value="/post/addProc.do", method=RequestMethod.GET)
	public String postAdd(@ModelAttribute("id") int id) {
		return "post/add";
	}
	
	@RequestMapping(value="/post/addProc.do", method=RequestMethod.POST)
	public String postAdd(PostVo vo) {
		postService.insert(vo);
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	@RequestMapping("/post/{no}/viewPage.do")
	public String view(@PathVariable("no") Long no, @PathVariable("id") String id, Model model) {
		PostVo postVo = postService.findByNo(no);
		List<CommentVo> commentVo = commentService.findAllComment(no);
		List<ReplyVo> replyVo = replyService.findAllReply(no);
		
		model.addAttribute("postVo", postVo);
		model.addAttribute("no", no);
		model.addAttribute("id", id);
		model.addAttribute("commentVo", commentVo);
		model.addAttribute("replyVo", replyVo);
		return "post/view";
	}
	
	@RequestMapping(value="/post/{no}/updateProc.do", method=RequestMethod.GET)
	public String postUpdate(@PathVariable("id") String id, @PathVariable("no") Long no, Model model) {
		PostVo postVo = postService.findByNo(no);
		model.addAttribute("id", id);
		model.addAttribute("no", no);
		model.addAttribute("postVo", postVo);
		return "post/update";
	}
	
	@RequestMapping(value="/post/{no}/updateProc.do", method=RequestMethod.POST)
	public String postUpdate(PostVo vo, @PathVariable("no") Long no) {
		vo.setNo(no);
		postService.update(vo);
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	
	
	@RequestMapping("/post/{no}/delete.do")
	public String postDelete(@PathVariable("no") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			postService.delete(no);
		}
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	// ------------- Comment 구역 -------------
	
	@RequestMapping(value="/post/{no}/comment/addProc.do", method=RequestMethod.POST)
	public String commentAdd(CommentVo vo, @PathVariable("no") Long no) {
		vo.setPostNo(no);
		commentService.insert(vo);
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	
	@RequestMapping("/post/{no}/comment/{commentno}/delete.do")
	public String commentDelete(@PathVariable("commentno") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			commentService.delete(no);
		}
		
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	
	// ------------- Reply 구역 -------------
	
	@RequestMapping(value="/post/{no}/comment/{commentno}/reply/addProc.do", method=RequestMethod.POST)
	public String replyAdd(ReplyVo vo, @PathVariable("no") Long no, @PathVariable("commentno") Long commentno) {
		vo.setPostNo(no);
		vo.setCommentNo(commentno);
		replyService.insert(vo);
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	
	@RequestMapping("/post/{no}/reply/{replyno}/delete.do")
	public String replyDelete(@PathVariable("replyno") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			replyService.delete(no);
		}
		
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
}
