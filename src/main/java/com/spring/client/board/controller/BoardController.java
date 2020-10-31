package com.spring.client.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j //정확한 메서드 확인위해
@RequestMapping("/board/*")
@AllArgsConstructor //매개변수 가진 생성자
public class BoardController {
	
	private BoardService BoardService;
	
	//**********************************
	//글목록 구헌하기(페이징 처리 목록 조회)
	//**********************************
	@RequestMapping(value="/boardList",method=RequestMethod.GET)
	//@GetMapping("/boardList")
	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardList 호출 성공");
		//전체 레코드 조회
		List<BoardVO> boardList = BoardService.boardList(bvo);
		model.addAttribute("boardList",boardList);
		
		return "board/boardList";
	}
	
	//**********************************
	//글쓰기 폼 출력하기
	//**********************************
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") BoardVO bvo) {
		log.info("writeForm 호출 성공");
		
		return "board/writeForm";
	}
	
	/**********************************
	* 글쓰기 등록 처리
	**********************************/
	@RequestMapping(value="/boardInsert", method=RequestMethod.POST)
	//@PostMapping("/boardInsert")
	public String boardInsert(BoardVO bvo, Model model) {
		log.info("boardInsert 호출 성공");
		
		int result=0;
		String url="";
		
		result=BoardService.boardInsert(bvo);
		if(result==1) {
			url="/board/boardList";
		}else {
			url="/board/writeForm";
		}
		
		return "redirect:"+url;
	}
	
	/**********************************
	* 글 상세 보기 구현
	**********************************/
	@RequestMapping(value="/boardDetail",method=RequestMethod.GET)
	//@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardDetail 성공");
		
		BoardVO detail = BoardService.boardDetail(bvo);
		model.addAttribute("detail",detail);
		
		return "board/boardDetail";
	}
	/***********************************
	 * 
	 * 
	 * @param b_num
	 * @param b_pwd
	 * @return int로 result를 0 또는 1을 리턴할 수도 있고, String로 result 값을 "success or fail, 일치, 불일치 "를 리턴할 수 이싿.
	 * 
	 * 참고 : @ResponseBody는 전달된 뷰를 통해서 출력하는 것이 아니라
	 * 	HTTP Response Body 에 직접 출력하는 방식.
	 * 	produces 속성은 지정한 미디어 타입과 관련된 응답을 생성하는데 사용한 실제 컨텐트 타입을 보장
	 */
	@ResponseBody
	@RequestMapping(value = "/pwdConfirm", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
		log.info("pwdConfirm 호출성공");
		String value = "";
		
		//아래 변수에는 입력 성공에 대한 상태값 저장(1 ㅐ또느 0)
		int result = BoardService.pwdConfirm(bvo);
		if (result==1) {
			value="성공";
		}else {
			value="실패";
		}
		log.info("result = "+ result);
		return value;
	}
}
