package com.spring.client.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_=@Autowired)
	private BoardDAO boardDAO;
	
//	@Test
//	public void testBoardList() {
//		BoardVO bvo=new BoardVO();
//		List<BoardVO> list=boardDAO.boardList(bvo);
//		for(BoardVO vo : list) {
//			log.info(vo);
//		}
//	}
	
//	@Test
//	public void testBoardInsert() {
//		BoardVO bvo=new BoardVO();
//		bvo.setB_name("rr");
//		bvo.setB_pwd("1234");
//		bvo.setB_title("qweqweqwe");
//		bvo.setB_content("qweafadraewr");
//		
//		boardDAO.boardInsert(bvo);
//		log.info(bvo);
//	}
	
	@Test
	public void testBoardDetail() {
		BoardVO bvo=new BoardVO();
		bvo.setB_num(2);
		BoardVO board=boardDAO.boardDetail(bvo);
		
		log.info(board.toString());
	}
	@Test
	public void testPwdConfirm() {
		BoardVO bvo = new BoardVO();
		bvo.setB_pwd("1");
		bvo.setB_num(1);
		int result=boardDAO.pwdConfirm(bvo);
	}
}
