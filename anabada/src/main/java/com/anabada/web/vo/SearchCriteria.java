package com.anabada.web.vo;

public class SearchCriteria extends Criteria {

	private String j_addr1 = "전국";
	private String j_cate = "모두";
	private String j_method = "모두";
	private String j_term = "모두";
	
	public String getJ_addr1() {
		return j_addr1;
	}
	public void setJ_addr1(String j_addr1) {
		this.j_addr1 = j_addr1;
	}
	public String getJ_cate() {
		return j_cate;
	}
	public void setJ_cate(String j_cate) {
		this.j_cate = j_cate;
	}
	public String getJ_method() {
		return j_method;
	}
	public void setJ_method(String j_method) {
		this.j_method = j_method;
	}
	public String getJ_term() {
		return j_term;
	}
	public void setJ_term(String j_term) {
		this.j_term = j_term;
	}
	
	
	@Override
	public String toString() {
		return "SearchCriteria [j_addr1=" + j_addr1 + ", j_cate=" + j_cate + ", j_method=" + j_method + ", j_term="
				+ j_term + "]";
	}
	
	
	
}
