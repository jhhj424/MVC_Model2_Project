package model;

import java.util.Date;

public class Comment {
	private int cnum; // ��۹�ȣ
	private int num; // �Խù���ȣ
	private String id;// ���̵�
	private String comment; // ����
	private Date regdate;// �ۼ���¥
	private int recmd;// ��õ��

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getRecmd() {
		return recmd;
	}

	public void setRecmd(int recmd) {
		this.recmd = recmd;
	}

	@Override
	public String toString() {
		return "Comment [cnum=" + cnum + ", num=" + num + ", id=" + id + ", comment=" + comment + ", regdate=" + regdate
				+ ", recmd=" + recmd + "]";
	}
}
