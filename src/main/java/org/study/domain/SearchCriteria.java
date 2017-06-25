package org.study.domain;

public class SearchCriteria extends Criteria{
   private String searchType;
   private String keyword;
   private String categoryType;
   
   public String getCategoryType() {
      return categoryType;
   }
   public void setCategoryType(String categoryType) {
      this.categoryType = categoryType;
   }
   @Override
   public String toString() {
      return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", categoryType=" + categoryType
            + "]";
   }

   public String getSearchType() {
      return searchType;
   }
   public void setSearchType(String searchType) {
      this.searchType = searchType;
   }
   public String getKeyword() {
      return keyword;
   }
   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }
   
   
   
}