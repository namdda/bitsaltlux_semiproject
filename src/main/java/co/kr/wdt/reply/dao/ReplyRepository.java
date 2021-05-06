package co.kr.wdt.reply.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.reply.vo.ReplyVo;

@Repository
public class ReplyRepository extends CommonSqlDao2{

	private static String PREFIX = "ReplyMapper.";
	
	public List<ReplyVo> findAllReply(Long postNo) {
		return selectList(PREFIX + "findAllReply", postNo);
	}
	
	public void insert(ReplyVo vo) {
		insert(PREFIX + "insert", vo);
	}

	public void delete(Long no) {
		delete(PREFIX + "delete", no);
	}
}
