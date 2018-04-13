package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ESC
 */
@WebServlet(name = "clientPage", urlPatterns = {"/clientPage"})
public class clientPage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("clientPage.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter writer = response.getWriter();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String clientID = session.getAttribute("clientID").toString();
        HashMap<String, String> userData = (HashMap<String, String>) session.getAttribute("userData");
        ArrayList<HashMap<String, String>> allData = (ArrayList<HashMap<String, String>>) session.getAttribute("allData");
        request.getRequestDispatcher("clientPage.jsp").forward(request, response);
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
