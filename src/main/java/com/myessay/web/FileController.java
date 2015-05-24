package com.myessay.web;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myessay.model.Uploadfile;
import com.myessay.model.UploadfileRepository;

@Controller
public class FileController {
	
	@Autowired
	private UploadfileRepository uploadFileRepo;
	
	@RequestMapping(method = RequestMethod.GET, value = "/files/{id}")
	public void showFile(@PathVariable("id") int id, HttpServletResponse response, Model model)
		throws Exception{
		Uploadfile uploadfile = uploadFileRepo.findOne(id);
        if (uploadfile != null) {
            byte[] image = uploadfile.getFile();
            if (image != null) {
                try {
                    response.setContentType(uploadfile.getFileContentType());
                    OutputStream out = response.getOutputStream();
                    IOUtils.copy(new ByteArrayInputStream(image), out);
                    out.flush();
                } catch (IOException e) {
                    e.printStackTrace();
                    throw new Exception("File Open Error.");
                }
            }
        }		
	}
}
