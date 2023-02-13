/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.tech.blog.helper.Helper;
import database.ConnectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Azizul Hakim'PC
 */
@WebServlet(name = "PostServlet", urlPatterns = {"/PostServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class PostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    PrintWriter out = null;
    Connection con = null;
    PreparedStatement ps = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession(false);
            String folderName = "blogpic";
            Part filePart = request.getPart("pPic");//Textbox value of name file.
            String fileName = filePart.getSubmittedFileName();
            String uploadPath = request.getServletContext().getRealPath("") + folderName;//for netbeans use this code
            //String path = request.getRealPath("/") + "Blog_pics" + File.separator + part.getSubmittedFileName();
            //String uploadPath = request.getServletContext().getRealPath("") + folderName;//for eclipse use this code
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            int cId = Integer.parseInt(request.getParameter("cId"));//Textbox value of name firstname.
            int userId = Integer.parseInt(request.getParameter("userId"));//Textbox value of name firstname.

            Timestamp added_date = new Timestamp(System.currentTimeMillis());
            String title = request.getParameter("pTitle");
            String content = request.getParameter("pContent");
            System.out.println("fileName: " +fileName);
            System.out.println("Path: " + uploadPath);
            System.out.println("Event ID: " + cId);
            //Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
            String path = uploadPath + File.separator + fileName;
            Helper.saveFile(filePart.getInputStream(), path);

            try {
                con = ConnectionProvider.getCon();
                System.out.println("connection done");
                ps = con.prepareStatement("insert into posts(pTitle,pContent,pPic,pDate,catId,userId) values(?,?,?,?,?,?)");
                ps.setString(1, title);
                ps.setString(2, content);
                ps.setString(3, fileName);
                ps.setTimestamp(4, added_date);
                ps.setInt(5, cId);
                ps.setInt(6, userId);
                int status = ps.executeUpdate();
                if (status > 0) {
                    session.setAttribute("fileName", fileName);
                    String msg = "" + fileName + " File uploaded successfully...";
                    request.setAttribute("msg", msg);
                    response.sendRedirect("blogs.jsp?cId=0&msg=Post Submitted successfully...");
                    System.out.println("File uploaded successfully...");
                    System.out.println("Uploaded Path: " + uploadPath);
                }
            } catch (SQLException e) {
                out.println("Exception: " + e);
                System.out.println("Exception1: " + e);
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    out.println(e);
                }
            }

        } catch (IOException | ServletException e) {
            out.println("Exception: " + e);
            System.out.println("Exception2: " + e);
        }
    }

}
