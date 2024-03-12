package com.fp.shuttlecock.leagueboard;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LeagueboardDTO {
	private int leagueboardId;
	private String title;
	private String content;
	private Timestamp regdate;
	private String winner;
	private String loser;
	private String userId;
	private int delete_yn;
	
	public LeagueboardDTO(String title, String content, String winner, String loser) {
		this.title = title;
		this.content = content;
		this.winner = winner;
		this.loser = loser;
	}
}
