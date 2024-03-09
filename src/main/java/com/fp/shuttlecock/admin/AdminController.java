package com.fp.shuttlecock.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

	@Autowired
	AdminServiceImpl service;

	// 모든회원 리스트
	@GetMapping("/admin")
	public String getAllUserList(Model model) {
		List<UserDTO> userList = service.getAllUserList();
		model.addAttribute("userList", userList);

		return "admin/adminPage";
	}

	// 회원 상세보기
	@GetMapping("/admin/{userId}")
	public String getUserByUserId(@PathVariable String userId, Model model) {
		UserDTO user = service.getUserByUserId(userId);
		model.addAttribute("user", user);

		return "admin/adminPageDetail";
	}

	// 관리자 부여
	@PostMapping("/admin/{userId}")
	public String updateUserAdmin(@PathVariable String userId, @ModelAttribute UserDTO newUser) {
		String view = "error/error";
		UserDTO user = null;
		boolean result = false;
		
		user = service.getUserByUserId(userId);
		user.setAdmin(newUser.getAdmin());
		result = service.updateUserAdmin(user);

		if (result) {
			view = "redirect:/admin";
			return view;
		}
		return view;
	}

	// 오늘 방문자수
	@GetMapping("/visitor")
	public String todayVisit(Model model) {
		List<VisitorDTO> visitorList = service.todayVisit();
		model.addAttribute("visitorList", visitorList);

		return "admin/visitor";
	}

}
