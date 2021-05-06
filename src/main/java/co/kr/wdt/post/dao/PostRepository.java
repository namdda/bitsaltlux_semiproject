package co.kr.wdt.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.post.vo.PostVo;

@Repository
public class PostRepository extends CommonSqlDao2 {
	
	private static String PREFIX = "PostMapper.";

	public List<PostVo> findAllPost(BlogVo blogVo) {
		return selectList(PREFIX + "findAllPost", blogVo);
	}

	public void insert(PostVo vo) {
		insert(PREFIX + "insert", vo);
	}

	public PostVo findByNo(Long no) {
		return (PostVo) selectOne(PREFIX + "findByNo", no);
	}

	public void delete(Long post_no) {
		delete(PREFIX + "delete", post_no);
		
	}

	public void update(PostVo vo) {
		update(PREFIX + "update", vo);
	}

	public int getCount(int id) {
		return (int) selectOne(PREFIX + "getCount", id);
	}

	public int findPostByKeyword(String keyword) {
		return (int) selectOne(PREFIX + "findPostByKeyword", keyword);
	}

	public List<PostVo> findByKeyword(BlogVo blogVo) {
		return selectList(PREFIX + "findByKeyword", blogVo);
	}

}
