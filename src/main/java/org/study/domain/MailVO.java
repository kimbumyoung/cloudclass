package org.study.domain;

public class MailVO {
   private String name;
   private String message;
   private String emailaddress;
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getMessage() {
      return message;
   }
   public void setMessage(String message) {
      this.message = message;
   }
   public String getEmailaddress() {
      return emailaddress;
   }
   public void setEmailaddress(String emailaddress) {
      this.emailaddress = emailaddress;
   }
   @Override
   public String toString() {
      return "MailVO [name=" + name + ", message=" + message + ", emailaddress=" + emailaddress + "]";
   }   
}