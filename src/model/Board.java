package model;

import java.util.Date;
import java.util.Set;

public class Board {
	private int num; //�۹�ȣ
	private String id; //ȸ��id
	private String pass;//�Խñۺ�й�ȣ
	private String subject;//����
	private String content;//����
	private String country;//����
	private String loc;//����
	private String file1;//����
	private String sdate;//������߳�¥
	private String edate;//���ึ������¥
	private Date regdate;//�ۼ���¥
	private int maxpno;//�ִ��ο�
	private int readcnt;//��ȸ��
	private int recmd;//��õ��
	private int type;//�Խù�Ÿ��
	// ���Ͱ���~����~//15���÷�
	
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getMaxpno() {
		return maxpno;
	}
	public void setMaxpno(int maxpno) {
		this.maxpno = maxpno;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getRecmd() {
		return recmd;
	}
	public void setRecmd(int recmd) {
		this.recmd = recmd;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Board [num=" + num + ", id=" + id + ", pass=" + pass + ", subject=" + subject + ", content=" + content
				+ ", country=" + country + ", loc=" + loc + ", file1=" + file1 + ", sdate=" + sdate + ", edate=" + edate
				+ ", regdate=" + regdate + ", maxpno=" + maxpno + ", readcnt=" + readcnt + ", recmd=" + recmd
				+ ", type=" + type + "]";
	}
	
}
