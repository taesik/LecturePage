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
@Log4j //��Ȯ�� �޼��� Ȯ������
@RequestMapping("/board/*")
@AllArgsConstructor //�Ű����� ���� ������
public class BoardController {
	
	private BoardService BoardService;
	
	//**********************************
	//�۸�� �����ϱ�(����¡ ó�� ��� ��ȸ)
	//**********************************
	@RequestMapping(value="/boardList",method=RequestMethod.GET)
	//@GetMapping("/boardList")
	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardList ȣ�� ����");
		//��ü ���ڵ� ��ȸ
		List<BoardVO> boardList = BoardService.boardList(bvo);
		model.addAttribute("boardList",boardList);
		
		return "board/boardList";
	}
	
	//**********************************
	//�۾��� �� ����ϱ�
	//**********************************
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") BoardVO bvo) {
		log.info("writeForm ȣ�� ����");
		
		return "board/writeForm";
	}
	
	/**********************************
	* �۾��� ��� ó��
	**********************************/
	@RequestMapping(value="/boardInsert", method=RequestMethod.POST)
	//@PostMapping("/boardInsert")
	public String boardInsert(BoardVO bvo, Model model) {
		log.info("boardInsert ȣ�� ����");
		
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
	* �� �� ���� ����
	**********************************/
	@RequestMapping(value="/boardDetail",method=RequestMethod.GET)
	//@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardDetail ����");
		
		BoardVO detail = BoardService.boardDetail(bvo);
		model.addAttribute("detail",detail);
		
		return "board/boardDetail";
	}
	/***********************************
	 * 
	 * 
	 * @param b_num
	 * @param b_pwd
	 * @return int�� result�� 0 �Ǵ� 1�� ������ ���� �ְ�, String�� result ���� "success or fail, ��ġ, ����ġ "�� ������ �� �̚�.
	 * 
	 * ���� : @ResponseBody�� ���޵� �並 ���ؼ� ����ϴ� ���� �ƴ϶�
	 * 	HTTP Response Body �� ���� ����ϴ� ���.
	 * 	produces �Ӽ��� ������ �̵�� Ÿ�԰� ���õ� ������ �����ϴµ� ����� ���� ����Ʈ Ÿ���� ����
	 */
	@ResponseBody
	@RequestMapping(value = "/pwdConfirm", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
		log.info("pwdConfirm ȣ�⼺��");
		String value = "";
		
		//�Ʒ� �������� �Է� ������ ���� ���°� ����(1 ���Ǵ� 0)
		int result = BoardService.pwdConfirm(bvo);
		if (result==1) {
			value="����";
		}else {
			value="����";
		}
		log.info("result = "+ result);
		return value;
	}
}
