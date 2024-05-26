package com.kh.journey.review.vo;

public class ReviewVo {
	

	private String no;
	public ReviewVo() {
		super();
	}
	public ReviewVo(String no, String reserveNo, String content, String accuracy, String clean, String checkin,
			String location, String communication, String delYn, String enrollDate, String modifyDate,
			String writerName, String writerNo, String profile, String starAvg) {
		super();
		this.no = no;
		this.reserveNo = reserveNo;
		this.content = content;
		this.accuracy = accuracy;
		this.clean = clean;
		this.checkin = checkin;
		this.location = location;
		this.communication = communication;
		this.delYn = delYn;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.writerName = writerName;
		this.writerNo = writerNo;
		this.profile = profile;
		this.starAvg = starAvg;
	}
	@Override
	public String toString() {
		return "ReviewVo [no=" + no + ", reserveNo=" + reserveNo + ", content=" + content + ", accuracy=" + accuracy
				+ ", clean=" + clean + ", checkin=" + checkin + ", location=" + location + ", communication="
				+ communication + ", delYn=" + delYn + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", writerName=" + writerName + ", writerNo=" + writerNo + ", profile=" + profile + ", starAvg="
				+ starAvg + "]";
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(String reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}
	public String getClean() {
		return clean;
	}
	public void setClean(String clean) {
		this.clean = clean;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCommunication() {
		return communication;
	}
	public void setCommunication(String communication) {
		this.communication = communication;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(String writerNo) {
		this.writerNo = writerNo;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(String starAvg) {
		this.starAvg = starAvg;
	}
	private String reserveNo;
	private String content;
	private String accuracy;
	private String clean;
	private String checkin;
	private String location;
	private String communication;
	private String delYn;
	private String enrollDate;
	private String modifyDate;
	private String writerName;
	private String writerNo;
	private String profile;
	private String starAvg;
	
	
}