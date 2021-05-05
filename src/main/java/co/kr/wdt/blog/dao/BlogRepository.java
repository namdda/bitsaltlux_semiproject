package co.kr.wdt.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.common.dao.CommonSqlDao2;

@Repository
public class BlogRepository extends CommonSqlDao2 {
	
	
	private static String PREFIX = "BlogMapper.";
	
	public List<BlogVo> findAllBlog() {
		return selectList(PREFIX + "findAllBlog");
	}

	public BlogVo findById(int user_id) {
		return (BlogVo) selectOne(PREFIX + "findById", user_id);
	}

	public void insert(BlogVo vo) {
		insert(PREFIX + "insert", vo);
	}

	public void update(BlogVo blogVo) {
		update(PREFIX + "update", blogVo);
	}

	public void delete(int user_id) {
		delete(PREFIX + "delete", user_id);
	}

	

}
