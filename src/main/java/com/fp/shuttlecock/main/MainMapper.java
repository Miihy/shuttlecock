package com.fp.shuttlecock.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fp.shuttlecock.freeboard.FreeboardDTO;
import com.fp.shuttlecock.leagueboard.LeagueboardDTO;
import com.fp.shuttlecock.user.UserDTO;

@Mapper
public interface MainMapper {

	List<LeagueboardDTO> get5LeaguePosts();

	List<FreeboardDTO> get5FreePosts();

	int updateCommunityBadge(UserDTO user);

	List<BadgeDTO> getBadgeList(int badgeType);

	void updateUserLeagueGrade();
	
}
