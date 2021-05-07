package co.kr.wdt.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.wdt.blog.service.BlogService;
import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.message.service.MessageService;
import co.kr.wdt.message.vo.MessageVo;
import co.kr.wdt.security.Auth;
import co.kr.wdt.security.AuthUser;
import co.kr.wdt.user.vo.UserVo;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private BlogService blogService;
	
	@Auth
	@RequestMapping("/{id}/mainPage.do")
	public String index(@PathVariable("id") int id, Model model) {
		List<MessageVo> msgFromVo = messageService.findFromMessage(id); // 내가 보낸 쪽지들
		List<MessageVo> msgToVo = messageService.findToMessage(id);	// 내가 받은 쪽지들
		
		model.addAttribute("msgFromVo", msgFromVo);
		model.addAttribute("msgToVo", msgToVo);
		
		return "message/index";
	}
	
	@Auth
	@RequestMapping(value="/{id}/sendProc.do", method=RequestMethod.GET)
	public String send(@AuthUser UserVo userVo, @PathVariable("id") int id, Model model) {
		BlogVo toVo = blogService.findMyBlog(id);
		
		model.addAttribute("toVo", toVo);
		model.addAttribute("id", id);
		
		return "message/send";
	}
	
	@Auth
	@RequestMapping(value="/{id}/sendProc.do", method=RequestMethod.POST)
	public String send(MessageVo messageVo, @PathVariable("id") int id) {
		messageService.send(messageVo);
		return "redirect:/message/{id}/mainPage.do";
	}
	
	@Auth
	@RequestMapping("/{id}/deleteProc.do")
	public String delete(@PathVariable("id") int id, @RequestParam("no") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			messageService.delete(no);
		}
		return "redirect:/message/{id}/mainPage.do";
	}
}
