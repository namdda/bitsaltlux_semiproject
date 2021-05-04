package co.kr.wdt.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.todo.dao.TodoDao;
import co.kr.wdt.todo.vo.TodoVo;


@Service
public class TodoService {
	@Autowired
	TodoDao todoRepository;
	// 
	public void addTodo(TodoVo vo) {
		todoRepository.insert(vo);
	}
	//TODO: 이름 중복 허용하지 말아야한다.
	// 전체 아이템의 개수를 가져온다. 
	public int selectCount() {
		return todoRepository.selectCount();
	}
	// 전체 todo를 가져온다 ( 이용자 기준 )
	public List<TodoVo> getAllByUserno(int userno){
		List<TodoVo> list = todoRepository.selectAll(userno);
//		System.out.println(list);
		return list;
	}
	// todo를 삭제한다. 
	public boolean eraseTodo(int no) {
		TodoVo vo = new TodoVo();
		vo.setNo(no);
		return todoRepository.delete(vo);
	}
	// todo를 수정한다
	public boolean modifyTodo(TodoVo vo) {
		return todoRepository.update(vo);
	}
}
