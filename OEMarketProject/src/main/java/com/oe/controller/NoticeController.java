package com.oe.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.Criteria_notice;
import com.oe.domain.Criteria_suggest;
import com.oe.domain.NoticeVO;
import com.oe.domain.PageDTO_mypage;
import com.oe.domain.PageDTO_notice;
import com.oe.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/center/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;
	
	@GetMapping("/center")
	public void getListCenter(Model model) {
		log.info("center");
		
		model.addAttribute("listCenter", service.getListCenter());
		model.addAttribute("noticeCenter", service.getNoticeCenter());
	}
	
	@GetMapping("/notice")
	public void getListNotice(Criteria_mypage cri, Model model) {
		int totalNotice = service.getTotalNotice();
		log.info("Notice - cri : " + cri);
		log.info("Notice - totalNotice : " + totalNotice);
		
		model.addAttribute("listNotice", service.getListNotice(cri));
		model.addAttribute("pageMaker", new PageDTO_mypage(cri, totalNotice));
	}
	
	@GetMapping("/FAQ")
	public void getListCenter(Criteria_notice cri, Model model) {
		 if(cri.getSort()==null) {
			 cri.setSort("");
		 }
		 if(cri.getKeyword()==null) {
			 cri.setKeyword("");
		 }
		
		int totalFAQ = service.getTotalFAQ();
		
		log.info("FAQ");
		log.info("cri : " + cri);
		log.info("totalFAQ : " + totalFAQ);
		
		model.addAttribute("listFAQ", service.getListFaqWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO_notice(cri, totalFAQ));
	}
	
	@GetMapping({"/noticeDetails", "/FAQDetails"})
	public void getNotice(Integer no_num, Model model) {
		log.info("noticeDetails or FAQDetails");
		log.info("no_num : " + no_num);
		service.increaseRC(no_num);
		model.addAttribute("notice", service.getNotice(no_num));
	}
	
	@GetMapping({"/noticeInsert", "/FAQInsert"})
	public void Register() {log.info("Register");}
	
	@GetMapping({"/noticeUpdate", "/FAQUpdate"})
	public void Modify(NoticeVO vo, Model model) {
		log.info("Modify - vo : " + vo);
		model.addAttribute("no_num", vo.getNo_num());
		model.addAttribute("no_title", vo.getNo_title());
		model.addAttribute("no_content", vo.getNo_content());
	}
	
	@PostMapping("/noticeInsert")
	public String regNotice(NoticeVO vo, RedirectAttributes rttr) {
		log.info("noticeInsert - " + vo);
		service.regNotice(vo);
		rttr.addFlashAttribute("result", vo.getNo_num());
		return "redirect:/center/notice";
	}
	
	@PostMapping("/FAQInsert")
	public String regFAQ(NoticeVO vo, RedirectAttributes rttr) {
		log.info("FAQInsert - " + vo);
		service.regFAQ(vo);
		rttr.addFlashAttribute("result", vo.getNo_num());
		return "redirect:/center/FAQ";
	}
	
	@PostMapping("/noticeUpdate")
	public String modifyNotice(NoticeVO vo, @ModelAttribute("cri") Criteria_mypage cri, RedirectAttributes rttr) {
		log.info("noticeUpdate - " + vo);
		
		service.modify(vo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		rttr.addFlashAttribute("result", "success");
		return "redirect:/center/notice";
	}
	
	@PostMapping("/FAQUpdate")
	public String modifyFAQ(NoticeVO vo,  RedirectAttributes rttr) {
		log.info("FAQUpdate - " + vo);
		
		service.modify(vo);
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("result", "success");
		return "redirect:/center/FAQ";
	}
	
	@PostMapping("/removeNotice")
	public String removeNotice(Integer no_num, @ModelAttribute("cri") Criteria_suggest cri, RedirectAttributes rttr) {
		log.info("removeNotice - " + no_num);

		service.remove(no_num);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		rttr.addFlashAttribute("result", "success");
		return "redirect:/center/notice";
	}
	
	@PostMapping("/removeFAQ")
	public String removeFAQ(Integer no_num, RedirectAttributes rttr) {
		log.info("removeFAQ - " + no_num);
		
		service.remove(no_num);
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("result", "success");
		return "redirect:/center/FAQ";
	}
}
