package co.kr.wdt.todo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.todo.dao.TodoDao;
import co.kr.wdt.todo.service.TodoService;
import co.kr.wdt.todo.vo.TodoVo;


@Service
public class TodoServiceImpl implements TodoService{
	@Autowired
	TodoDao todoDao;
	
	@Override
	public void addTodo(TodoVo vo) {
		todoDao.insert(vo);
	}
	//TODO: 이름 중복 허용하지 말아야한다.
	// 전체 아이템의 개수를 가져온다. 
	@Override
	public int selectCount() {
		return todoDao.selectCount();
	}
	
	// 전체 todo를 가져온다 ( 이용자 기준 )
	@Override
	public List<TodoVo> getAllByUserno(int userno){
		List<TodoVo> list = todoDao.selectAll(userno);
//		System.out.println(list);
		return list;
	}
	// todo를 삭제한다. 
	@Override
	public boolean eraseTodo(int no) {
		TodoVo vo = new TodoVo();
		vo.setNo(no);
		return todoDao.delete(vo);
	}
	// todo를 수정한다
	@Override
	public boolean modifyTodo(TodoVo vo) {
		return todoDao.update(vo);
	}
}
