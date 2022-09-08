package com.oe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.PageDTO_mypage;
import com.oe.service.SellBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor

public class SellBoardController {
   
   private SellBoardService service;
   
   @GetMapping("sellBoard")
   public void readAll(Model model,Criteria_mypage cri,String my_id,String filter) {
      if(filter == null) {
         filter = "";
      }
      log.info("SEllBOARD====================cri : " + cri);
      log.info("SEllBOARD====================my_id : " + my_id);
      log.info("======================filter : "+filter);
      int total = service.getTotal(my_id,filter);
      log.info("======================total : "+total);
      log.info("======================List : "+service.getListWithPaging(cri,my_id,filter));
      model.addAttribute("sell", service.getListWithPaging(cri,my_id,filter));
      model.addAttribute("pageMaker", new PageDTO_mypage(cri, total));
   }
   
   
   
}