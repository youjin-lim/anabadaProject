package com.anabada.web.vo;

public class PutInVO {
	
	private String id;
	private int p_bno;
	private String p_name;
	private String p_gender;
	private String p_tel;
	private String p_age;
	private String p_company;
	private String p_start;
	private String p_end;
	private int j_bno;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_bno() {
		return p_bno;
	}
	public void setP_bno(int p_bno) {
		this.p_bno = p_bno;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public String getP_tel() {
		return p_tel;
	}
	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}
	public String getP_age() {
		return p_age;
	}
	public void setP_age(String p_age) {
		this.p_age = p_age;
	}
	public String getP_company() {
		return p_company;
	}
	public void setP_company(String p_company) {
		this.p_company = p_company;
	}
	public String getP_start() {
		return p_start;
	}
	public void setP_start(String p_start) {
		this.p_start = p_start;
	}
	public String getP_end() {
		return p_end;
	}
	public void setP_end(String p_end) {
		this.p_end = p_end;
	}
	public int getJ_bno() {
		return j_bno;
	}
	public void setJ_bno(int j_bno) {
		this.j_bno = j_bno;
	}
	
	@Override
	public String toString() {
		return "PutInVO [id=" + id + ", p_bno=" + p_bno + ", p_name=" + p_name + ", p_gender=" + p_gender + ", p_tel="
				+ p_tel + ", p_age=" + p_age + ", p_company=" + p_company + ", p_start=" + p_start + ", p_end=" + p_end
				+ ", j_bno=" + j_bno + "]";
	}
	

}
