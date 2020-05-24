package com.withme.vo;

import java.sql.Date;

public class PickJoinListVO {
   
   private String u_id;
   private int party_id;
   private int party_host;
   private int pick_flag;
   private int join_flag;
   private String party_title;
   private Date p_date;
   
   
   public String getU_id() {
      return u_id;
   }

   public void setU_id(String u_id) {
      this.u_id = u_id;
   }

   public int getParty_id() {
      return party_id;
   }

   public void setParty_id(int party_id) {
      this.party_id = party_id;
   }

   public int getParty_host() {
      return party_host;
   }

   public void setParty_host(int party_host) {
      this.party_host = party_host;
   }

   public int getPick_flag() {
      return pick_flag;
   }

   public void setPick_flag(int pick_flag) {
      this.pick_flag = pick_flag;
   }

   public int getJoin_flag() {
      return join_flag;
   }

   public void setJoin_flag(int join_flag) {
      this.join_flag = join_flag;
   }

   public String getParty_title() {
      return party_title;
   }

   public void setParty_title(String party_title) {
      this.party_title = party_title;
   }

   public Date getP_date() {
      return p_date;
   }

   public void setP_date(Date p_date) {
      this.p_date = p_date;
   }
   

   @Override
   public String toString() {
      return "PickJoinListVO [u_id=" + u_id + ", party_id=" + party_id +
            ", party_host=" + party_host + ", pick_flag=" + pick_flag +
            ", join_flag=" + join_flag + ", party_title=" + party_title +
            ", p_date=" + p_date + "]";
   }
   
}