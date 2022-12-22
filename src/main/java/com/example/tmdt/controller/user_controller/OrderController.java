package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.*;
import com.example.tmdt.mail.Mail;
import com.example.tmdt.service.OrderService;
import com.example.tmdt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");

        Account account =(Account) session.getAttribute("acc");
        Cart cart  = (Cart) session.getAttribute("cart");

        Order order = new Order(account,cart.total(),"1",fullname,address,phone_number);

        int order_id = OrderService.getInstance().createOrder(order);
        for (Product p : cart.getData()) {
            OrderDetail orderDetail = new OrderDetail(order_id,p,p.getSellPrice(),p.getQuantitySold());
            OrderService.getInstance().createOrderDetail(orderDetail);
            ProductService.getInstance().updateProductQuantity(p,p.getQuantitySold());
        }
        String email = account.getEmail();
        String subject = "Order Confirmation";
        String content = "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "<title></title>\n" +
                "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
                "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n" +
                "<style type=\"text/css\">\n" +
                "\n" +
                "body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }\n" +
                "table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }\n" +
                "img { -ms-interpolation-mode: bicubic; }\n" +
                "\n" +
                "img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }\n" +
                "table { border-collapse: collapse !important; }\n" +
                "body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; }\n" +
                "\n" +
                "\n" +
                "a[x-apple-data-detectors] {\n" +
                "    color: inherit !important;\n" +
                "    text-decoration: none !important;\n" +
                "    font-size: inherit !important;\n" +
                "    font-family: inherit !important;\n" +
                "    font-weight: inherit !important;\n" +
                "    line-height: inherit !important;\n" +
                "}\n" +
                "\n" +
                "@media screen and (max-width: 480px) {\n" +
                "    .mobile-hide {\n" +
                "        display: none !important;\n" +
                "    }\n" +
                "    .mobile-center {\n" +
                "        text-align: center !important;\n" +
                "    }\n" +
                "}\n" +
                "div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\n" +
                "</style>\n" +
                "<body style=\"margin: 0 !important; padding: 0 !important; background-color: #eeeeee;\" bgcolor=\"#eeeeee\">\n" +
                "\n" +
                "\n" +
                "<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">\n" +
                "For what reason would it be advisable for me to think about business content? That might be little bit risky to have crew member like them. \n" +
                "</div>\n" +
                "\n" +
                "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
                "    <tr>\n" +
                "        <td align=\"center\" style=\"background-color: #eeeeee;\" bgcolor=\"#eeeeee\">\n" +
                "        \n" +
                "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
                "            <tr>\n" +
                "                <td align=\"center\" valign=\"top\" style=\"font-size:0; padding: 35px;\" bgcolor=\"#F44336\">\n" +
                "               \n" +
                "                <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\">\n" +
                "                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
                "                        <tr>\n" +
                "                            <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;\" class=\"mobile-center\">\n" +
                "                                <h1 style=\"font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;\">Box Perfume</h1>\n" +
                "                            </td>\n" +
                "                        </tr>\n" +
                "                    </table>\n" +
                "                </div>\n" +
                "                \n" +
                "                <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\" class=\"mobile-hide\">\n" +
                "                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
                "                        <tr>\n" +
                "                            <td align=\"right\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\">\n" +
                "                                <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"right\">\n" +
                "                                    <tr>\n" +
                "                                        <td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400;\">\n" +
                "                                            <p style=\"font-size: 18px; font-weight: 400; margin: 0; color: #ffffff;\"><a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\">Shop &nbsp;</a></p>\n" +
                "                                        </td>\n" +
                "                                        <td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 24px;\">\n" +
                "                                            <a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\"><img src=\"https://img.icons8.com/color/48/000000/small-business.png\" width=\"27\" height=\"23\" style=\"display: block; border: 0px;\"/></a>\n" +
                "                                        </td>\n" +
                "                                    </tr>\n" +
                "                                </table>\n" +
                "                            </td>\n" +
                "                        </tr>\n" +
                "                    </table>\n" +
                "                </div>\n" +
                "              \n" +
                "                </td>\n" +
                "            </tr>\n" +
                "            <tr>\n" +
                "                <td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n" +
                "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
                "                    <tr>\n" +
                "                        <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">\n" +
                "                            <img src=\"https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" /><br>\n" +
                "                            <h2 style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\">\n" +
                "                                Thank You For Your Order!\n" +
                "                            </h2>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td align=\"left\" style=\"padding-top: 20px;\">\n" +
                "                            <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\n" +
                "                                <tr>\n" +
                "                                    <td width=\"75%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n" +
                "                                        Order Confirmation #\n" +
                "                                    </td>\n" +
                "                                    <td width=\"25%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n" +
                "                                        "+order_id+"\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">\n" +
                "                                        Purchased Item ("+cart.getData().size()+")\n" +
                "                                    </td>\n" +
                "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">\n" +
                "                                        $"+cart.total()+"\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\n" +
                "                                        Shipping + Handling\n" +
                "                                    </td>\n" +
                "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\n" +
                "                                        $0\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                            </table>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td align=\"left\" style=\"padding-top: 20px;\">\n" +
                "                            <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\n" +
                "                                <tr>\n" +
                "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">\n" +
                "                                        TOTAL\n" +
                "                                    </td>\n" +
                "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">\n" +
                "                                        $"+cart.total()+"\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                            </table>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                </table>\n" +
                "                \n" +
                "                </td>\n" +
                "            </tr>\n" +
                "             <tr>\n" +
                "                <td align=\"center\" height=\"100%\" valign=\"top\" width=\"100%\" style=\"padding: 0 35px 35px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n" +
                "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:660px;\">\n" +
                "                    <tr>\n" +
                "                        <td align=\"center\" valign=\"top\" style=\"font-size:0;\">\n" +
                "                            <div style=\"display:inline-block; max-width:50%; min-width:240px; vertical-align:top; width:100%;\">\n" +
                "\n" +
                "                                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
                "                                    <tr>\n" +
                "                                        <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;\">\n" +
                "                                            <p style=\"font-weight: 800;\">Delivery Address</p>\n" +
                "                                            <p>"+address+"</p>\n" +
                "\n" +
                "                                        </td>\n" +
                "                                    </tr>\n" +
                "                                </table>\n" +
                "                            </div>\n" +
                "                            <div style=\"display:inline-block; max-width:50%; min-width:240px; vertical-align:top; width:100%;\">\n" +
                "                                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
                "                                    <tr>\n" +
                "                                        <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;\">\n" +
                "                                            <p style=\"font-weight: 800;\">Phone Number</p>\n" +
                "                                            <p>"+phone_number+"</p>\n" +
                "                                        </td>\n" +
                "                                    </tr>\n" +
                "                                </table>\n" +
                "                            </div>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                </table>\n" +
                "                </td>\n" +
                "            </tr>\n" +
                "            <tr>\n" +
                "                <td align=\"center\" style=\" padding: 35px; background-color: #ff7361;\" bgcolor=\"#1b9ba3\">\n" +
                "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
                "                    <tr>\n" +
                "                        <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">\n" +
                "                            <h2 style=\"font-size: 24px; font-weight: 800; line-height: 30px; color: #ffffff; margin: 0;\">\n" +
                "                                Get 10% off your next order.\n" +
                "                            </h2>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td align=\"center\" style=\"padding: 25px 0 15px 0;\">\n" +
                "                            <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" +
                "                                <tr>\n" +
                "                                    <td align=\"center\" style=\"border-radius: 5px;\" bgcolor=\"#66b3b7\">\n" +
                "                                      <a href=\"#\" target=\"_blank\" style=\"font-size: 18px; font-family: Open Sans, Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 5px; background-color: #F44336; padding: 15px 30px; display: block;\">Shop Again</a>\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                            </table>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                </table>\n" +
                "                </td>\n" +
                "            </tr>\n" +
                "            <tr>\n" +
                "                <td align=\"center\" style=\"padding: 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n" +
                "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
                "                    <tr>\n" +
                "                        <td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;\">\n" +
                "                            <p style=\"font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;\">\n" +
                "                                If you didn't create an account using this email address, please ignore this email.\n" +
                "                            </p>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                </table>\n" +
                "                </td>\n" +
                "            </tr>\n" +
                "        </table>\n" +
                "        </td>\n" +
                "    </tr>\n" +
                "</table>\n" +
                "    \n" +
                "</body>\n" +
                "</html>\n";

        Mail.sendMail(email,subject,content);
        session.removeAttribute("cart");
        cart.getData().clear();
        response.sendRedirect("ordersuccess");
    }
}
