package com.controller.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ImageUploadServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("hii");
        String filename = this.getServletContext().getAttribute("upload_path") + req.getPathInfo();
        // retrieve mimeType dynamically
        String mime = this.getServletContext().getMimeType(filename);
        if (mime == null) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        resp.setContentType(mime);
        File file = new File(filename);
        resp.setContentLength((int)file.length());

        FileInputStream in = new FileInputStream(file);
        OutputStream out = resp.getOutputStream();

        // Copy the contents of the file to the output stream
        byte[] buf = new byte[1024];
        int count = 0;
        while ((count = in.read(buf)) >= 0) {
            out.write(buf, 0, count);
        }
        out.close();
        in.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        JSONArray images = new JSONArray();
        try {
            List<FileItem> multiparts = new ServletFileUpload(
                    new DiskFileItemFactory()).parseRequest(req);
            String uploadPath = this.getServletContext().getAttribute("upload_path").toString();
            for (FileItem item : multiparts) {
                if (!item.isFormField()) {
                    String name = new File(item.getName()).getName();
                    String ext = name.substring(name.lastIndexOf('.'));
                    String fileName = ((Long) System.currentTimeMillis()).toString() + ext;
                    item.write(new File(uploadPath + "/" + fileName));
                    images.put("http://localhost:8080/images/" + fileName);
                }
            }

            if(images.length() > 0){
                JSONObject result = new JSONObject();
                result.put("result", "success");
                result.put("message", "Images are uploaded successfully");
                result.put("images", images);
                out.print(result.toString());
                return;
            } else {
                JSONObject result = new JSONObject();
                result.put("result", "success");
                result.put("message", "Images are not uploaded successfully. Please try again.");
                return;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        out.print("{\"result\": \"failed\",\"message\": \"Image upload failed!\"}");
    }
}
