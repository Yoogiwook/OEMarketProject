package com.oe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oe.service.BuyBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class BuyBoardController {

   private BuyBoardService service;
   
   @GetMapping("buyBoard")
   public void readBuyAll(Model model, String bo_image,String my_id) {
      bo_image = "대표사진1장";
      log.info("my_id : " + my_id);
      model.addAttribute("bo_image", bo_image);
      model.addAttribute("buy", service.readBuyAll(my_id));
   }
   
   
   
}