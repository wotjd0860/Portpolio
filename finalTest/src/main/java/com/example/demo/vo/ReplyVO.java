package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReplyVO {
	private int re_no;
	private int p_id;
	private int p_no;
	private String re_content;
	private String re_writer;
	private Date date;
	private int re_ref;
	private int re_level;
	private int re_step;
	private int cust_no;
}
