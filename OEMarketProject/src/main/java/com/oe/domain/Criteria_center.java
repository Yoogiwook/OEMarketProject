package com.oe.domain;

import lombok.Data;

@Data
public class Criteria_center {
  private int pageNum;
  private int amount;
  private String keyword;
  
  public Criteria_center() {
     this(1, 10);
  }

  public Criteria_center(int pageNum, int amount) {
     this.pageNum  = pageNum;
     this.amount = amount;
  }
}
