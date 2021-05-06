package co.kr.wdt.message.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.message.vo.MessageVo;

@Repository
public class MessageRepository extends CommonSqlDao2{
	
	private static String PREFIX = "MessageMapper.";
	
	public List<MessageVo> findFromMessage(int userId) {
		return selectList(PREFIX + "findFromMessage", userId);
	}

	public List<MessageVo> findToMessage(int userId) {
		return selectList(PREFIX + "findToMessage", userId);
	}

	public void send(MessageVo messageVo) {
		insert(PREFIX+ "insert", messageVo);
	}

	public void delete(Long no) {
		delete(PREFIX + "delete", no);
	}
	
	

}
