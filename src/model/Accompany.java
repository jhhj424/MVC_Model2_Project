package model;

public class Accompany {
	private String id; //신청인아이디
	private int num; //게시글번호
	private int chk; //동행 상태 체크
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	@Override
	public String toString() {
		return "accompany [id=" + id + ", num=" + num + ", chk=" + chk + "]";
	}
	
}
