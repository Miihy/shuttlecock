package com.fp.shuttlecock.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserDTO {
	private String userId;
	private String pw;
	private String username;
	private int gender;
	private int admin;
	private String userEmail;
	private String userImage;
	private String userPhone;
	private int userLeagueGrade;
	private int wincount;
	private int losecount;
	private int writeCount;
	private int badge_badgeId;

	@Builder
	public UserDTO(String userId, String pw, String username, int gender, int admin, String userEmail, String userImage,
			String userPhone, int userLeagueGrade, int wincount, int losecount, int writeCount, int badge_badgeId) {
		super();
		this.userId = userId;
		this.pw = pw;
		this.username = username;
		this.gender = gender;
		this.admin = admin;
		this.userEmail = userEmail;
		this.userImage = userImage;
		this.userPhone = userPhone;
		this.userLeagueGrade = userLeagueGrade;
		this.wincount = wincount;
		this.losecount = losecount;
		this.writeCount = writeCount;
		this.badge_badgeId = badge_badgeId;
	}
}
