package com.spring.client.board.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int b_num =0; //�۹�ȣ
	private String b_name=""; //�ۼ���
	private String b_title=""; //����
	private String b_content=""; //����
	private String b_date; //�ۼ���
	private String b_pwd=""; //��й�ȣ
}
