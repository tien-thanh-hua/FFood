/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.FoodDAO;
import DAOs.OrderDAO;
import Models.Account;
import Models.Food;
import Models.Order;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author CE171454 Hua Tien Thanh
 */
public class AdminController extends HttpServlet {

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try ( PrintWriter out = response.getWriter()) {
      /* TODO output your page here. You may use following sample code. */
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet AdminController</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
      out.println("</body>");
      out.println("</html>");
    }
  }

  private void processUser(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String path = request.getRequestURI();
    if (path.endsWith("/admin/user/add")) {
      request.getRequestDispatcher("/addUser.jsp").forward(request, response);
    } else if (path.startsWith("/admin/user/update")) {
      String[] s = path.split("/");
      int accountID = Integer.parseInt(s[s.length - 1]);
      AccountDAO dao = new AccountDAO();
      Account account = dao.getAccount(accountID);
      if (account == null) {
        response.sendRedirect("/admin");
      } else {
        HttpSession session = request.getSession();
        session.setAttribute("user-info", account);
        request.getRequestDispatcher("/updateUser.jsp").forward(request, response);
      }
    } else if (path.startsWith("/admin/user/delete")) {
      String[] s = path.split("/");
      int accountID = Integer.parseInt(s[s.length - 1]);
      AccountDAO dao = new AccountDAO();
      dao.delete(accountID);
      response.sendRedirect("/admin");
    }
  }

  private void processFood(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String path = request.getRequestURI();
    if (path.endsWith("/admin/food/add")) {
      request.getRequestDispatcher("/addFood.jsp").forward(request, response);
    } else if (path.startsWith("/admin/food/update")) {
      String[] s = path.split("/");
      short foodID = Short.parseShort(s[s.length - 1]);
      FoodDAO dao = new FoodDAO();
      Food food = dao.getFood(foodID);
      if (food == null) {
        response.sendRedirect("/admin");
      } else {
        HttpSession session = request.getSession();
        session.setAttribute("food-info", food);
        request.getRequestDispatcher("/updateFood.jsp").forward(request, response);
      }
    } else if (path.startsWith("/admin/food/delete")) {
      String[] s = path.split("/");
      short foodID = Short.parseShort(s[s.length - 1]);
      FoodDAO dao = new FoodDAO();
      dao.delete(foodID);
      response.sendRedirect("/admin");
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String path = request.getRequestURI();
    if (path.endsWith("/admin") || path.endsWith("/admin/")) {
      FoodDAO foodDAO = new FoodDAO();
      List<Food> foodList = foodDAO.getAllList();
      AccountDAO accountDAO = new AccountDAO();
      List<Account> userAccountList = accountDAO.getAllUser();
      OrderDAO orderDAO = new OrderDAO();
      List<Order> orderList = orderDAO.getAllList();
      
      request.setAttribute("foodList", foodList);
      request.setAttribute("userAccountList", userAccountList);
      request.setAttribute("orderList", orderList);
      request.getRequestDispatcher("/admin.jsp").forward(request, response);
    } else if (path.endsWith("/admin/")) {
      response.sendRedirect("/admin");
    } else if (path.startsWith("/admin/food")) {
      processFood(request, response);
    } else if (path.startsWith("/admin/user")) {
      processUser(request, response);
    } else {
      response.setContentType("text/css");
      request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
