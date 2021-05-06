package co.kr.wdt.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.comment.dao.CommentRepository;
import co.kr.wdt.comment.vo.CommentVo;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	public List<CommentVo> findAllComment(Long postNo) {
		return commentRepository.findAllComment(postNo);
	}

	public void insert(CommentVo vo) {
		commentRepository.insert(vo);
		
	}

	public void delete(Long no) {
		commentRepository.delete(no);
		
	}

}
