package co.kr.wdt.post.controller;

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
import co.kr.wdt.comment.service.CommentService;
import co.kr.wdt.comment.vo.CommentVo;
import co.kr.wdt.common.service.FileUploadService;
import co.kr.wdt.common.vo.BlogPageVo;
import co.kr.wdt.post.service.PostService;
import co.kr.wdt.post.vo.PostVo;
import co.kr.wdt.reply.service.ReplyService;
import co.kr.wdt.reply.vo.ReplyVo;
import co.kr.wdt.security.Auth;

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
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	

	@RequestMapping("/mainPage.do")
	public String index(Model model, @PathVariable("id") int id, @RequestParam(value="page", required=false) String pageNum) {
		BlogPageVo pageVo = new BlogPageVo(pageNum, postService.getCount(id), 5);
		BlogVo blogVo = blogService.findMyBlog(id);		
	 	List<PostVo> postVo = postService.findAllPost(id, pageVo.getCurPage());

	 	if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
			return "redirect:/blog/{id}/mainPage.do";
		}
		
		model.addAttribute("blogVo", blogVo);
		model.addAttribute("postVo", postVo);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("id", id);

		return "post/index";
	}
	
	@Auth
	@RequestMapping(value="/post/addProc.do", method=RequestMethod.GET)
	public String postAdd(@ModelAttribute("id") int id) {
		return "post/add";
	}
	
	@Auth
	@RequestMapping(value="/post/addProc.do", method=RequestMethod.POST)
	public String postAdd(PostVo postVo, @RequestParam("file") MultipartFile file) {
		if(file.isEmpty()) {
			postVo.setOriginFile(null);
			postVo.setStoredFile(null);
		} else {
			List<String> path = fileUploadService.uploadFile(file, uploadPath);
			postVo.setOriginFile(path.get(0));
			postVo.setStoredFile(path.get(1));
		}
		
		postService.insert(postVo);
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
	
	@Auth
	@RequestMapping(value="/post/{no}/updateProc.do", method=RequestMethod.GET)
	public String postUpdate(@PathVariable("id") String id, @PathVariable("no") Long no, Model model) {
		PostVo postVo = postService.findByNo(no);
		model.addAttribute("id", id);
		model.addAttribute("no", no);
		model.addAttribute("postVo", postVo);
		return "post/update";
	}
	
	@Auth
	@RequestMapping(value="/post/{no}/updateProc.do", method=RequestMethod.POST)
	public String postUpdate(PostVo postVo, @PathVariable("no") Long no, @RequestParam("file") MultipartFile file) {
		if(file.isEmpty()) {
			if(postVo.getOriginFile() != null ) {
				fileUploadService.postDelete(postVo, uploadPath);
			}
			postVo.setOriginFile(null);
			postVo.setStoredFile(null);
		} else {
			List<String> path = fileUploadService.uploadFile(file, uploadPath);
			postVo.setOriginFile(path.get(0));
			postVo.setStoredFile(path.get(1));
		}
		postVo.setNo(no);
		postService.update(postVo);
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	
	@Auth
	@RequestMapping("/post/{no}/delete.do")
	public String postDelete(@PathVariable("no") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			postService.delete(no);
		}
		return "redirect:/blog/{id}/mainPage.do";
	}
	
	// ------------- Comment 구역 -------------
	@Auth
	@RequestMapping(value="/post/{no}/comment/addProc.do", method=RequestMethod.POST)
	public String commentAdd(CommentVo vo, @PathVariable("no") Long no) {
		vo.setPostNo(no);
		commentService.insert(vo);
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	@Auth
	@RequestMapping("/post/{no}/comment/{commentno}/delete.do")
	public String commentDelete(@PathVariable("commentno") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			commentService.delete(no);
		}
		
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	
	// ------------- Reply 구역 -------------
	@Auth
	@RequestMapping(value="/post/{no}/comment/{commentno}/reply/addProc.do", method=RequestMethod.POST)
	public String replyAdd(ReplyVo vo, @PathVariable("no") Long no, @PathVariable("commentno") Long commentno) {
		vo.setPostNo(no);
		vo.setCommentNo(commentno);
		replyService.insert(vo);
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
	@Auth
	@RequestMapping("/post/{no}/reply/{replyno}/delete.do")
	public String replyDelete(@PathVariable("replyno") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			replyService.delete(no);
		}
		
		return "redirect:/blog/{id}/post/{no}/viewPage.do";
	}
}
