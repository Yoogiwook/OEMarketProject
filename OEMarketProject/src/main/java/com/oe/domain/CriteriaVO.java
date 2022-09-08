package com.oe.domain;

public class CriteriaVO {
   private int pageNum;
   private int amount;
   
   private String type;
   private String keyword;
   
   public String[] getTypeArr() {
      return type == null ? new String[] {} : type.split("");
   }
   
   public CriteriaVO() {
      this(1,6);
   }
   
   public CriteriaVO(int pagenum, int amount) {
      this.pageNum = pagenum;
      this.amount = amount;
      
      
   }

   public int getPageNum() {
      return pageNum;
   }

   public void setPageNum(int pageNum) {
      this.pageNum = pageNum;
   }

   public int getAmount() {
      return amount;
   }

   public void setAmount(int amount) {
      this.amount = amount;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getKeyword() {
      return keyword;
   }

   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }

   @Override
   public String toString() {
      return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword + "]";
   }
   
   
}