package com.oe.domain;

import org.springframework.beans.factory.annotation.Autowired;

public class PageDTO {
   private int startPage;
   private int endPage;
   private boolean prev, next;
   private int total;
   
   @Autowired
   private CriteriaVO cri;

   public PageDTO(CriteriaVO cri, int total) { 
      this.cri = cri; //1,6
      this.total = total; //9
                     //ceil : 올림
      this.endPage =(int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
      this.startPage = endPage-9;
                     //      소수점 붙여주기위해 *1.0
      int readEnd =(int)(Math.ceil((total*1.0)/cri.getAmount()));

      if(endPage>readEnd) {
         endPage = readEnd; //2
      }
      
      this.prev = this.startPage > 1;
      this.next = this.endPage < readEnd;
      
      
   }

public int getStartPage() {
   return startPage;
}

public int getEndPage() {
   return endPage;
}

public boolean isPrev() {
   return prev;
}

public boolean isNext() {
   return next;
}

public int getTotal() {
   return total;
}

public CriteriaVO getCri() {
   return cri;
}

@Override
public String toString() {
   return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", total="
         + total + ", cri=" + cri + ", getStartPage()=" + getStartPage() + ", getEndPage()=" + getEndPage()
         + ", isPrev()=" + isPrev() + ", isNext()=" + isNext() + ", getTotal()=" + getTotal() + ", getCri()="
         + getCri() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
         + super.toString() + "]";
}

public void setStartPage(int startPage) {
   this.startPage = startPage;
}

public void setEndPage(int endPage) {
   this.endPage = endPage;
}

public void setPrev(boolean prev) {
   this.prev = prev;
}

public void setNext(boolean next) {
   this.next = next;
}

public void setTotal(int total) {
   this.total = total;
}

public void setCri(CriteriaVO cri) {
   this.cri = cri;
}


}