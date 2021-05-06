package co.kr.wdt.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.post.dao.PostRepository;
import co.kr.wdt.post.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;

	public List<PostVo> findAllPost(int blog_id, int curPage) {
		BlogVo blogVo = new BlogVo();
		blogVo.setUserId(blog_id);
		blogVo.setCurPage((curPage - 1) * 5);
		return postRepository.findAllPost(blogVo);
	}

	public void insert(PostVo vo) {
		postRepository.insert(vo);
	}

	public PostVo findByNo(Long no) {
		return postRepository.findByNo(no);
	}

	public void delete(Long post_no) {
		postRepository.delete(post_no);
		
	}

	public void update(PostVo vo) {
		postRepository.update(vo);
	}

	public int getCount(int id) {
		return postRepository.getCount(id);
	}

}
