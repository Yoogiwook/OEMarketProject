package com.oe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.HeartBoardVO;
import com.oe.domain.PageDTO_mypage;
import com.oe.service.HeartBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class HeartBoardController {
	private HeartBoardService service;
	
	@GetMapping("/heartBoard")
	public void getList(String my_id, @ModelAttribute("cri") Criteria_mypage cri, Model model) {
		int total = service.getTotal(my_id);
		
		log.info("getList : " + my_id);
		log.info("cri :  " + cri);
		log.info("total count : " + total);
		
		model.addAttribute("heartList", service.getList(cri, my_id));
		model.addAttribute("pageMaker", new PageDTO_mypage(cri, total));
	}
	
	@PostMapping("/removeHeart")
	public String removeHeart(HeartBoardVO hvo, @ModelAttribute("cri") Criteria_mypage cri, RedirectAttributes rttr) {
		log.info("removeHeart - hvo : " + hvo);
		log.info("removeHeart - cri : " + cri);
		service.removeHeart(cri, hvo);
		rttr.addAttribute("my_id", hvo.getHe_id());
		rttr.addAttribute("pageNum", cri.getPageNum());
		return "redirect:/mypage/heartBoard";
	}
}
