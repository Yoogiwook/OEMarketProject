package com.oe.domain;

import lombok.Data;

@Data
public class Criteria_notice {
  private int pageNum;
  private int amount;
  private String sort;
  private String keyword;
  
  public Criteria_notice() {
     this(1, 15);
  }

  public Criteria_notice(int pageNum, int amount) {
     this.pageNum  = pageNum;
     this.amount = amount;
  }
}
