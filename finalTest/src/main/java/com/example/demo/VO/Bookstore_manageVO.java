package com.example.demo.VO;

import java.sql.Date;

public class Bookstore_manageVO {
	private int bsm_no;
	private Date bsm_regdate;
	private int staff_no;
	private int bs_no;
	
	public Bookstore_manageVO() {
		super();
	}
	
	public Bookstore_manageVO(int bsm_no, Date bsm_regdate, int staff_no, int bs_no) {
		super();
		this.bsm_no = bsm_no;
		this.bsm_regdate = bsm_regdate;
		this.staff_no = staff_no;
		this.bs_no = bs_no;
	}
	public int getBsm_no() {
		return bsm_no;
	}
	public void setBsm_no(int bsm_no) {
		this.bsm_no = bsm_no;
	}
	public Date getBsm_regdate() {
		return bsm_regdate;
	}
	public void setBsm_regdate(Date bsm_regdate) {
		this.bsm_regdate = bsm_regdate;
	}
	public int getStaff_no() {
		return staff_no;
	}
	public void setStaff_no(int staff_no) {
		this.staff_no = staff_no;
	}
	public int getBs_no() {
		return bs_no;
	}
	public void setBs_no(int bs_no) {
		this.bs_no = bs_no;
	}
	
}
