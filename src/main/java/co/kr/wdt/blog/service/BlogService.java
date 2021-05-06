package co.kr.wdt.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.blog.dao.BlogRepository;
import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.post.dao.PostRepository;
import co.kr.wdt.post.vo.PostVo;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private PostRepository postRepository;
	
	public List<BlogVo> findAllBlog(int curPage) {
		return blogRepository.findAllBlog((curPage-1) * 3);
	}

	public BlogVo findMyBlog(int user_id) {
		return blogRepository.findById(user_id);
	}

	public void join(BlogVo vo) {
		blogRepository.insert(vo);
		
	}

	public void update(BlogVo blogVo) {
		blogRepository.update(blogVo);
	}

	public void delete(int user_id) {
		blogRepository.delete(user_id);
	}

	public int getCount() {
		return blogRepository.getCount();
	}

	public int findPostByKeyword(String keyword) {
		return postRepository.findPostByKeyword(keyword);
	}

	public List<PostVo> findByKeyword(String keyword, int curPage) {
		BlogVo blogVo = new BlogVo();
		blogVo.setKeyword(keyword);
		blogVo.setCurPage((curPage-1) *5);
		return postRepository.findByKeyword(blogVo);
	}

	
}
