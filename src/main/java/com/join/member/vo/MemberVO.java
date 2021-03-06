package com.join.member.vo;

import javax.validation.constraints.NotEmpty;

public class MemberVO {

	private int memberId;

	@NotEmpty(message="이메일을 입력해주세요!")
	private String memberEmail;
	@NotEmpty(message="비밀번호를 입력해주세요!")
	private String memberPassword;
	@NotEmpty(message="닉네임을 입력해주세요!")
	private String memberNickname;
	@NotEmpty(message="이름을 입력해주세요!")
	private String memberName;
	private String memberSex;
	private String memberProfileName;
	private String memberRegistDate;

	private int memberStyle1;
	private int memberStyle2;
	private int memberStyle3;
	private int memberStyle4;
	private int memberStyle5;

	private boolean maintainSession;
	
	private String salt;

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberSex() {
		return memberSex;
	}

	public void setMemberSex(String memberSex) {
		this.memberSex = memberSex;
	}

	public String getMemberProfileName() {
		if ( memberProfileName == null ) {
			memberProfileName = "";
		}
		return memberProfileName;
	}

	public void setMemberProfileName(String memberProfileName) {
		this.memberProfileName = memberProfileName;
	}

	public String getMemberRegistDate() {
		return memberRegistDate;
	}

	public void setMemberRegistDate(String memberRegistDate) {
		this.memberRegistDate = memberRegistDate;
	}

	public int getMemberStyle1() {
		return memberStyle1;
	}

	public void setMemberStyle1(int memberStyle1) {
		this.memberStyle1 = memberStyle1;
	}

	public int getMemberStyle2() {
		return memberStyle2;
	}

	public void setMemberStyle2(int memberStyle2) {
		this.memberStyle2 = memberStyle2;
	}

	public int getMemberStyle3() {
		return memberStyle3;
	}

	public void setMemberStyle3(int memberStyle3) {
		this.memberStyle3 = memberStyle3;
	}

	public int getMemberStyle4() {
		return memberStyle4;
	}

	public void setMemberStyle4(int memberStyle4) {
		this.memberStyle4 = memberStyle4;
	}

	public int getMemberStyle5() {
		return memberStyle5;
	}

	public void setMemberStyle5(int memberStyle5) {
		this.memberStyle5 = memberStyle5;
	}
	
	public boolean isMaintainSession() {
		return maintainSession;
	}

	public void setMaintainSession(boolean maintainSession) {
		this.maintainSession = maintainSession;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	
}
