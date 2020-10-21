package com.example.demo.VO;

import java.sql.Date;

public class Book_manageVO {
	private int bm_no;
	private Date bm_regdate;
	private Date bm_update;
	private int b_no;
	private int staff_no;
	
	public Book_manageVO() {
		super();
	}
	
	public Book_manageVO(int bm_no, Date bm_regdate, Date bm_update, int b_no, int staff_no) {
		super();
		this.bm_no = bm_no;
		this.bm_regdate = bm_regdate;
		this.bm_update = bm_update;
		this.b_no = b_no;
		this.staff_no = staff_no;
	}
	
	public int getBm_no() {
		return bm_no;
	}
	public void setBm_no(int bm_no) {
		this.bm_no = bm_no;
	}
	public Date getBm_regdate() {
		return bm_regdate;
	}
	public void setBm_regdate(Date bm_regdate) {
		this.bm_regdate = bm_regdate;
	}
	public Date getBm_update() {
		return bm_update;
	}
	public void setBm_update(Date bm_update) {
		this.bm_update = bm_update;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getStaff_no() {
		return staff_no;
	}
	public void setStaff_no(int staff_no) {
		this.staff_no = staff_no;
	}

}
