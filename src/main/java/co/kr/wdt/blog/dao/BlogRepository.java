package co.kr.wdt.blog.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.common.dao.CommonSqlDao2;

@Repository
public class BlogRepository extends CommonSqlDao2 {
	
	
	private static String PREFIX = "BlogMapper.";

	public BlogVo findById(int user_id) {
		return (BlogVo) selectOne(PREFIX + "findById", user_id);

	}

	public void insert(BlogVo vo) {
		insert(PREFIX + "insert", vo);
	}

}
