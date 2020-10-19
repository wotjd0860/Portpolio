package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class PostVO {
	private int p_id;
	private int p_no;
	private String p_title;
	private String p_writer;
	private String p_content;
	private int p_hit;
	private Date p_regdate;
	private int cust_no;
	private String fname;
	private String oldfname;
}
