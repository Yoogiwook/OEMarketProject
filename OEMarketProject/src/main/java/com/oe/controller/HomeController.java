package com.oe.controller;

import java.util.Arrays;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oe.config.StringToDate;
import com.oe.domain.CriteriaVO;
import com.oe.domain.MarketBoardVO;
import com.oe.domain.PageDTO;
import com.oe.service.MarketBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@WebAppConfiguration
@Log4j
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MarketBoardService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(MarketBoardVO vo, Model model, CriteriaVO cri) {
		// =========크롤링 날짜 지정=========
		StringToDate st = new StringToDate();

		Date d = st.transformatDate("20220728");
		try {
//			service.crawlingDelete();

			// 당근
			Document doc = Jsoup.connect("https://www.daangn.com/hot_articles").get();
			// 제목
			Elements title = doc.select("article.card-top a.card-link div.card-desc h2.card-title");
			// 가격
			Elements price = doc.select("article.card-top a.card-link div.card-desc div.card-price");
			// 주소
			Elements address = doc.select("article.card-top a.card-link div.card-desc div.card-region-name");
			// 하트
			Elements heart = doc.select("article.card-top a.card-link div.card-desc div.card-counts span");
			// 그림
			Elements poster = doc.select("article.card-top a.card-link div.card-photo img");
			// 상세페이지 링크
			Elements link = doc.select("article.card-top a.card-link");

			for (int j = 0; j < 0; j++) {
				try {
					Document doc2 = Jsoup.connect("https://www.daangn.com/" + link.get(j).attr("href")).get();

					Elements content = doc2.select("section#article-description div#article-detail p");

					vo = new MarketBoardVO();

					String price2 = price.get(j).text();
					String[] price3 = null;
					String price7 = null;
					if (price2.contains("원")) {
						price3 = price2.split("원");
						String price4 = Arrays.toString(price3);
						String price8 = price4.substring(price4.indexOf("[") + 1, price4.indexOf("]"));
						price7 = price8;

						if (price8.contains(",")) {
							String price5 = price4.substring(1, price4.indexOf(","));
							String price6 = price4.substring(price4.indexOf(",") + 1, price4.indexOf("]"));
							price7 = price5 + price6;
						}
						if(price2.contains("만")) {
							price7 = "0";
						}

					} else {
	                	   price7 = "0";
	                   }

					vo.setBo_title(title.get(j).text());
					vo.setBo_price(Long.parseLong(price7));
					vo.setBo_address1(address.get(j).text());
					String image = poster.get(j).attr("src");
					vo.setBo_image1(image);
					vo.setBo_content(content.text());

					// 임의로 넣어주는 값들
					vo.setBo_category("");
					vo.setBo_regdate(d);
					vo.setBo_id("crawling");
					vo.setBo_nickname("크롤링1");
					vo.setBo_count(95L);

//					service.crawlingregister(vo);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		int total = service.getTotal(cri);
		model.addAttribute("he_list", service.boardListOrderByHeart(cri));
		model.addAttribute("rg_list", service.boardListOrderByRegdate(cri));
		model.addAttribute("pageMaker",new PageDTO(cri, total));

		return "index";
	}
}