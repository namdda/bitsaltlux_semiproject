package co.kr.wdt.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.post.vo.PostVo;

@Repository
public class PostRepository extends CommonSqlDao2 {
	
	private static String PREFIX = "PostMapper.";

	public List<PostVo> findAllPost(int id) {
		return selectList(PREFIX + "findAllPost", id);
	}

}
