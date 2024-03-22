package com.fp.shuttlecock.main;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.shuttlecock.freeboard.FreeboardDTO;
import com.fp.shuttlecock.information.CompetitionServiceImpl;
import com.fp.shuttlecock.leagueboard.LeagueboardDTO;
import com.fp.shuttlecock.leagueboard.LeagueboardServiceImpl;
import com.fp.shuttlecock.leagueboard.PageRequestDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainContoller {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private LeagueboardServiceImpl leagueservice;
	
	@Autowired
	private CompetitionServiceImpl competitionService;
	 
	@Value("${KAKAO.KEY.JS}")
	private String apiKey;
	
	@GetMapping("/main")
    public String showMainPage(Model model, HttpSession session, PageRequestDTO pagerequest) throws ParseException {
		if(session.getAttribute("userId") != null) {
			pagerequest.setUserId(String.valueOf(session.getAttribute("userId")));
		}
		pagerequest.setIsMain(1);
		List<LeagueboardDTO> leaguePosts = leagueservice.getAllLeaguePostByPage(pagerequest);
		List<Map<String, Object>> events = competitionService.getCompetitionDB();
		List<FreeboardDTO> freePosts = mainService.get5FreePosts();
		
		model.addAttribute("leaguePosts", leaguePosts);
		model.addAttribute("freePosts", freePosts);
		model.addAttribute("apiKey", apiKey);
	    model.addAttribute("events", events);
		
//		session.getAttribute("events");
//		System.out.println(session.getAttribute("events"));
		
		// getGame에 저장된 events 가져오기
//		model.addAttribute("events", session.getAttribute("events"));
		
        return "main";
    }
	

	
	
}
