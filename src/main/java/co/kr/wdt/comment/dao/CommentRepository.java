package co.kr.wdt.comment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.comment.vo.CommentVo;
import co.kr.wdt.common.dao.CommonSqlDao2;

@Repository
public class CommentRepository extends CommonSqlDao2 {

	private static String PREFIX = "CommentMapper.";
	
	public List<CommentVo> findAllComment(Long postNo) {
		return selectList(PREFIX + "findAllComment", postNo);
	}

	public void insert(CommentVo vo) {
		insert(PREFIX + "insert", vo);
	}

	public void delete(Long no) {
		delete(PREFIX + "delete", no);
		
	}

}
