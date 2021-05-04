package co.kr.wdt.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.blog.dao.BlogRepository;
import co.kr.wdt.blog.vo.BlogVo;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepository;

	public BlogVo findMyBlog(int user_id) {
		return blogRepository.findById(user_id);
	}

	public void join(BlogVo vo) {
		blogRepository.insert(vo);
		
	}
}
