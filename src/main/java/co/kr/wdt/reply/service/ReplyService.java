package co.kr.wdt.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.reply.dao.ReplyRepository;
import co.kr.wdt.reply.vo.ReplyVo;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyRepository replyRepository;

	public void insert(ReplyVo vo) {
		replyRepository.insert(vo);
	}

	public void delete(Long no) {
		replyRepository.delete(no);
	}

	public List<ReplyVo> findAllReply(Long postNo) {
		return replyRepository.findAllReply(postNo);
	}

}
