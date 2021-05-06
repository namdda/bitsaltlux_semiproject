package co.kr.wdt.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.message.vo.MessageVo;
import co.kr.wdt.message.dao.MessageRepository;

@Service
public class MessageService {

	@Autowired
	private MessageRepository messageRepository;
	
	public List<MessageVo> findFromMessage(int userId) {
		return messageRepository.findFromMessage(userId);
	}
	
	public List<MessageVo> findToMessage(int userId) {
		return messageRepository.findToMessage(userId);
	}

	public void send(MessageVo messageVo) {
		messageRepository.send(messageVo);
	}

	public void delete(Long no) {
		messageRepository.delete(no);
	}

}
