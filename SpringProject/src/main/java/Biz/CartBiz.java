package Biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import Model.*;


public class CartBiz {
   public void addCart(HttpServletRequest req, String[] items) {
      HttpSession session = req.getSession();
      List<CartDTO> cartList = (List<CartDTO>)session.getAttribute("cartList");
      
      if(cartList == null) {      //session�뿉 議댁옱�븯吏� �븡�쓣�븣
         cartList = new ArrayList<CartDTO>();
      }
      CartDTO cDTO = null;
      boolean newCart = true;
      for(int i=0; i<cartList.size(); i++) {
         cDTO = cartList.get(i);
         if(items[1].equals(cDTO.getPrdCode())) {
            newCart = false;
         }
      }
      if(items[3].equals("")) {
         items[3]="1";
      }
      if(newCart) {      // �깉濡쒖슫 �긽�뭹 �옣諛붽뎄�땲�뿉 異붽�
         cDTO = new CartDTO();
         cDTO.setPrdCode(items[1]);
         cDTO.setPrdName(items[0]);
         cDTO.setPrice(Integer.parseInt(items[2]));
         cDTO.setQty(Integer.parseInt(items[3]));
         cartList.add(cDTO);
      }
      session.setAttribute("cartList", cartList);
   }
   
   public ArrayList<CartDTO> getCart(HttpServletRequest req){
      HttpSession session = req.getSession();
      ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("cartList");
      return cartList;
   }
   
   public void upCartQty(HttpServletRequest req, String prdName){
      HttpSession session = req.getSession();
      ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("cartList");
      for(int i =0; i<cartList.size(); i++) {
         if(cartList.get(i).getPrdName().equals(prdName)) {
            cartList.get(i).setQty(cartList.get(i).getQty()+1);
         }
      }
   }
   
   public void downCartQty(HttpServletRequest req, String prdName){
      HttpSession session = req.getSession();
      ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("cartList");
      for(int i =0; i<cartList.size(); i++) {
         if(cartList.get(i).getPrdName().equals(prdName)) {
            cartList.get(i).setQty(cartList.get(i).getQty()-1);
         }
      }
   }
   
   public void removeCartItem(HttpServletRequest req, String[] prdName) {
      HttpSession session = req.getSession();
      ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("cartList");
      for(int i = 0; i < prdName.length; i++) {
         for(int j = 0; j < cartList.size(); j++) {
            if(prdName[i].equals(cartList.get(j).getPrdName())) {
               cartList.remove(cartList.get(j));
            }
         }
      }
   }
}