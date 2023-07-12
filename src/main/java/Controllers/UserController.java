/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CustomerDAO;
import Models.Account;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ibuyc
 */
public class UserController extends HttpServlet {

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
      out.println("<title>Servlet UserController</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
      out.println("</body>");
      out.println("</html>");
    }
  }

  private void doPostUpdateInfo(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    int accountID = Integer.parseInt(request.getParameter("txtAccountID"));
    String lastName = request.getParameter("txtLastName");
    String firstName = request.getParameter("txtFirstName");
    String phoneNumber = request.getParameter("txtPhoneNumber");
    String gender = request.getParameter("txtGender");
    String address = request.getParameter("txtAddress");
    int result = 0;

    Customer customer = new Customer(firstName, lastName, gender, phoneNumber, address);
    CustomerDAO customerDAO = new CustomerDAO();
    result = customerDAO.add(customer);

    if (result != 1) {
      // New Customer failed to be added to database
      response.sendRedirect("/user");
      return;
    }
    
    // Proceed to assign the customer to User account if the new Customer is
    // successfully added
    AccountDAO accountDAO = new AccountDAO();
    Account account = accountDAO.getAccount(accountID);
    account.setCustomerID(customer.getCustomerID());
    result = accountDAO.update(account);
    if (result != 1) {
      // Both Customer insertion and Account update procedures are successful
      response.sendRedirect("/user");
      return;
    } else {
      response.sendRedirect("/user");
      return;
    }
  }

  private void doPostUpdateUser(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    int accountID = Integer.parseInt(request.getParameter("txtAccountID"));
    String username = request.getParameter("txtAccountUsername");
    String email = request.getParameter("txtEmail");
    String password = (String) request.getAttribute("txtAccountPassword");

    AccountDAO accountDAO = new AccountDAO();
    Account account = new Account(username, email, password, "user");
    account.setAccountID(accountID);

    int result = accountDAO.update(account);

    if (result == 1) {
      response.sendRedirect("/user");
      return;
    } else {
      response.sendRedirect("/user");
      return;
    }
  }

  private void doGetOrder(HttpServletRequest request, HttpServletResponse response) {
    throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
    if (path.endsWith("/user")) {
      int userID = (Integer) request.getAttribute("userID");
      AccountDAO accountDAO = new AccountDAO();
      Account currentAccount = accountDAO.getAccount(userID);

      request.setAttribute("currentAccount", currentAccount);
      request.getRequestDispatcher("/user.jsp").forward(request, response);
    } else if (path.endsWith("/user/")) {
      response.sendRedirect("/user");
    } else if (path.startsWith("/user/info")) {
      doPostUpdateInfo(request, response);
    } else if (path.startsWith("/user/account")) {
      doPostUpdateUser(request, response);
    } else if (path.startsWith("/user/orders")) {
      doGetOrder(request, response);
    } else {
      response.sendRedirect("/");
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
