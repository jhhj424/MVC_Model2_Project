package model;

public class Accompany {
	private String id; //��û�ξ��̵�
	private int num; //�Խñ۹�ȣ
	private int chk; //���� ���� üũ
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
