package co.kr.wdt.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.post.dao.PostRepository;
import co.kr.wdt.post.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;

	public List<PostVo> findAllPost(int id) {
		return postRepository.findAllPost(id);
	}

}
