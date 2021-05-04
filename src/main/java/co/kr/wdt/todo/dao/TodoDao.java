package co.kr.wdt.todo.dao;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.todo.vo.TodoVo;


@Repository
public class TodoDao extends CommonSqlDao2{
	
	private static String PREFIX = "TodoMapper.";
	// 생성
	public boolean insert(TodoVo vo) {
		return 1 == (int)insert(PREFIX +"insert", vo);
	}
	
	// 실제로 삭제(테스트용)
	public boolean hardDelete(TodoVo vo) {
		return 1 == (int)delete(PREFIX +"harddelete", vo);
	}
	// 삭제 기능 
	public boolean delete(TodoVo vo) {
		return 1 == (int)delete(PREFIX +"delete",vo);
	}
	// 수정 기능 
	public boolean update(TodoVo vo) {
		return 1 == (int)update(PREFIX +"update",vo);
	}
	// 전체 조회 기능
	public List<TodoVo> selectAll(int userno) {		
		return selectList(PREFIX +"selectall", userno);
	}
	// 조회 기능 (사용자번호 & 제목) - 테스트?
	public TodoVo selectByUsernoAndTitle(TodoVo vo) {
		return (TodoVo)selectOne(PREFIX +"selectbyusernotitle",vo);
	}
	// 조회 기능 (사용자번호 & 제목) - 테스트?
	public int selectCount() {
		return (int)selectOne(PREFIX +"selectcount");
	}
		
}
