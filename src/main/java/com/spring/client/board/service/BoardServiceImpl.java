package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;

//@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired) //onMethod_ 1.8이라 언더바 필요
	private BoardDAO boardDAO;
	
	//글목록 구현
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		List<BoardVO> list =null;
		list=boardDAO.boardList(bvo);
		return list;
	}
	
	//글입력 구현
	@Override
	public int boardInsert(BoardVO bvo) {
		int result=0;
		result=boardDAO.boardInsert(bvo);
		return result;
	}
	
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		BoardVO detail = null;
		detail=boardDAO.boardDetail(bvo);
		if(detail!=null) {
			detail.setB_content(detail.getB_content()
					.toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}

	@Override
	public int pwdConfirm(BoardVO bvo) {
		int result = 0;
		result = boardDAO.pwdConfirm(bvo);
		return result;
	}
}
