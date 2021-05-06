package co.kr.wdt.todo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import co.kr.wdt.education.vo.EducationVo;
import co.kr.wdt.todo.vo.TodoVo;

public interface TodoService {

	public void addTodo(TodoVo vo);

	public int selectCount();
	
	public List<TodoVo> getAllByUserno(int userno);
	
	public boolean eraseTodo(int no);
	
	public boolean modifyTodo(TodoVo vo);
	
	public List<TodoVo> getAchievementRateByUserno(int userno);
}
