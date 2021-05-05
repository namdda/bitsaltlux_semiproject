package co.kr.wdt.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.post.vo.PostVo;

@Repository
public class PostRepository extends CommonSqlDao2 {
	
	private static String PREFIX = "PostMapper.";

	public List<PostVo> findAllPost(int blog_id) {
		return selectList(PREFIX + "findAllPost", blog_id);
	}

	public void insert(PostVo vo) {
		insert(PREFIX + "insert", vo);
	}

	public PostVo findByNo(Long no) {
		return (PostVo) selectOne(PREFIX + "findByNo", no);
	}

}
