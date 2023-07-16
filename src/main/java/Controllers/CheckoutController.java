/*
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CartDAO;
import DAOs.CartItemDAO;
import DAOs.CustomerDAO;
import DAOs.FoodDAO;
import DAOs.OrderDAO;
import Models.Account;
import Models.Cart;
import Models.CartItem;
import Models.Customer;
import Models.Food;
import Models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Pattern;

/**
 *
 * @author LEGION
 */
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        HttpSession session = request.getSession();
        int userID = (Integer) session.getAttribute("userID");
        AccountDAO accountDAO = new AccountDAO();
        Account currentAccount = accountDAO.getAccount(userID);

        request.setAttribute("currentAccount", currentAccount);
        //</editor-fold>

        //<editor-fold defaultstate="collapsed" desc="Get customer info if it exists">
        // This info will be used to preload the "Thông tin của tôi" form
        // Default int values are assigned 0 instead of null
        if (currentAccount.getCustomerID() != 0) {
            //<editor-fold defaultstate="collapsed" desc="Get customer info">
            int customerID = currentAccount.getCustomerID();
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomer(customerID);

            request.setAttribute("customer", customer);
            //</editor-fold>

        }
        //</editor-fold>

        // Lưu trữ URL hiện tại vào session attribute
        session.setAttribute("previousUrl", request.getRequestURI());
//         processRequest(request, response);
//        HttpSession session = request.getSession();
//        Cart cart = (Cart) object1;
//        OrderDAO odao = new OrderDAO();
//        odao.insertOrderStatusNotCFYet(cart);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            request.setAttribute("mess", "Giỏ hàng trống, vui lòng chọn món để thanh toán");
            request.getRequestDispatcher("home").forward(request, response);
            return;
        }
        if (cart == null) {
            cart = new Cart();
        }
        String quantityParam = "";
        for (CartItem cartItem : cart.getItems()) {
            Short foodId = cartItem.getFood().getFoodID();

            if (request.getParameter("quantity-" + foodId) != null) {
                // Thông thường nếu truy cập /checkout thì sẽ có 2 cách truy cập:
                // 1 là từ nút Thanh toán (từ modal Giỏ hàng)
                // 2 là từ nút Đặt món (từ chính trang /checkout)
                // Tất cả đều sử dụng POST và dữ liệu lấy từ form của trang trước đó
                // nên ta sẽ lấy dữ liệu từ parameter
                quantityParam = request.getParameter("quantity-" + foodId);
            } else if (session.getAttribute("quantity-" + foodId) != null) {
                // Tuy nhiên nếu yêu cầu là GET, ví dụ như sau khi đăng nhập
                // hoặc đăng xuất thành công thì trả về trang hiện tại tức /checkout 
                // thì parameter của request sau khi submit form không còn,
                // nên ta phải lưu giá trị của form bằng session attribute,
                // do đó ta phải lấy từ session
                quantityParam = (String) session.getAttribute("quantity-" + foodId);
            }
            int quantity = Integer.parseInt(quantityParam);
            cartItem.setFoodQuantity(quantity); // Cập nhật số lượng cho mục trong giỏ hàng
            // Lưu lại số lượng của các mục trong trường hợp request là GET
            // ví dụ như sau khi đăng nhập/đăng xuất thành công tại /checkout
            session.setAttribute("quantity-" + foodId, quantityParam);
        }
        session.setAttribute("cart", cart);

        request.getRequestDispatcher("checkout.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Chạy vào phương thức doPost");
        if (request.getParameter("btnSubmit") != null
                && request.getParameter("btnSubmit").equals("SubmitOrder")) {

            System.out.println("tesst1");

            String lastname = request.getParameter("txtLastName");
            String firstname = request.getParameter("txtFirstName");
            String gender = request.getParameter("txtGender");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");
            String note = request.getParameter("txtNote");

            Customer customer = new Customer(firstname, lastname, gender, phone, address);

            CustomerDAO customerdao = new CustomerDAO();
            int result = customerdao.add(customer);
            if (result != 1) {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }

// chuyen vo trang home sau khi thanh toan 
            request.getRequestDispatcher("home").forward(request, response);

//
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");

            System.out.println(cart);

            customer = customerdao.getLatestCustomer();  // customerId lay tu DB ra tang dan

            CartDAO cartdao = new CartDAO();

            int cart1 = cartdao.getLatestCartID();   // cartId lay tu DB ra tang dan

            System.out.println(cart1);

            System.out.println("customerid :" + customer.getCustomerID());

            cart.setUserId(customer.getCustomerID());

            System.out.println("userCardID :" + cart.getId());

            result = cartdao.add(cart);
            if (result != 1) {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);

            }
            System.out.println("result= " + result);

            List<CartItem> cartItemList = cart.getItems();
            CartItemDAO cartitemdao = new CartItemDAO();

            for (CartItem item : cartItemList) {
                System.out.println(item);

                item.setCartID(cart.getId());

                result = cartitemdao.add(item);

                if (result != 1) {
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);

                }

                System.out.println(result);
                // Lấy thời gian hiện tại
                LocalDateTime currentTime = LocalDateTime.now();
                // Chuyển đổi thời gian hiện tại thành Timestamp
                Timestamp orderTime = Timestamp.valueOf(currentTime);
                // Tạo một số ngẫu nhiên từ 5 đến 15
                int randomMinutes = ThreadLocalRandom.current().nextInt(5, 16);
                // Tính toán deliveryTime bằng cách cộng thời gian giao hàng ngẫu nhiên với orderTime
                LocalDateTime deliveryDateTime = currentTime.plusMinutes(randomMinutes);
                Timestamp deliveryTime = Timestamp.valueOf(deliveryDateTime);
                // get cartid 
                OrderDAO orderdao = new OrderDAO();
                //   cart = cartdao.getLatestCartID();
                int cartId = cart.getId();
                // get customerId
                customer = customerdao.getLatestCustomer();
                int customerId = customer.getCustomerID();
                Order order = new Order(cartId, customerId, (byte) 2, (byte) 3, phone, address, orderTime, note, deliveryTime);
                result = orderdao.add(order);
                if (result != 1) {
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                }

                session.removeAttribute("cart");

            }
        } else if (request.getParameter("btnSubmit") != null
                && request.getParameter("btnSubmit").equals("Checkout")) {
            System.out.println("tesst222");
            System.out.println("Chạy vào phần else if");

            HttpSession session = request.getSession();
            int userID = (Integer) session.getAttribute("userID");
        AccountDAO accountDAO = new AccountDAO();
        Account currentAccount = accountDAO.getAccount(userID);

        request.setAttribute("currentAccount", currentAccount);
        //</editor-fold>

        //<editor-fold defaultstate="collapsed" desc="Get customer info if it exists">
        // This info will be used to preload the "Thông tin của tôi" form
        // Default int values are assigned 0 instead of null
        if (currentAccount.getCustomerID() != 0) {
            //<editor-fold defaultstate="collapsed" desc="Get customer info">
            int customerID = currentAccount.getCustomerID();
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomer(customerID);

            request.setAttribute("customer", customer);
            //</editor-fold>

        }
        //</editor-fold>

        // Lưu trữ URL hiện tại vào session attribute
        session.setAttribute("previousUrl", request.getRequestURI());
//         processRequest(request, response);
//        HttpSession session = request.getSession();
//        Cart cart = (Cart) object1;
//        OrderDAO odao = new OrderDAO();
//        odao.insertOrderStatusNotCFYet(cart);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            request.setAttribute("mess", "Giỏ hàng trống, vui lòng chọn món để thanh toán");
            request.getRequestDispatcher("home").forward(request, response);
            return;
        }
        if (cart == null) {
            cart = new Cart();
        }
        String quantityParam = "";
        for (CartItem cartItem : cart.getItems()) {
            Short foodId = cartItem.getFood().getFoodID();

            if (request.getParameter("quantity-" + foodId) != null) {
                // Thông thường nếu truy cập /checkout thì sẽ có 2 cách truy cập:
                // 1 là từ nút Thanh toán (từ modal Giỏ hàng)
                // 2 là từ nút Đặt món (từ chính trang /checkout)
                // Tất cả đều sử dụng POST và dữ liệu lấy từ form của trang trước đó
                // nên ta sẽ lấy dữ liệu từ parameter
                quantityParam = request.getParameter("quantity-" + foodId);
            } else if (session.getAttribute("quantity-" + foodId) != null) {
                // Tuy nhiên nếu yêu cầu là GET, ví dụ như sau khi đăng nhập
                // hoặc đăng xuất thành công thì trả về trang hiện tại tức /checkout 
                // thì parameter của request sau khi submit form không còn,
                // nên ta phải lưu giá trị của form bằng session attribute,
                // do đó ta phải lấy từ session
                quantityParam = (String) session.getAttribute("quantity-" + foodId);
            }
            int quantity = Integer.parseInt(quantityParam);
            cartItem.setFoodQuantity(quantity); // Cập nhật số lượng cho mục trong giỏ hàng
            // Lưu lại số lượng của các mục trong trường hợp request là GET
            // ví dụ như sau khi đăng nhập/đăng xuất thành công tại /checkout
            session.setAttribute("quantity-" + foodId, quantityParam);
        }
        session.setAttribute("cart", cart);

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }

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
