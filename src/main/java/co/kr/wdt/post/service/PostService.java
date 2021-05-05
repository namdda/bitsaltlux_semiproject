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

	public List<PostVo> findAllPost(int blog_id) {
		return postRepository.findAllPost(blog_id);
	}

	public void insert(PostVo vo) {
		postRepository.insert(vo);
	}

	public PostVo findByNo(Long no) {
		return postRepository.findByNo(no);
	}

}
