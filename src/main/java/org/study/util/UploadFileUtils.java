package org.study.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		String uploadedFileName = null;
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		if(MediaUtils.getMediaType(formatName) !=null){ //이미지 파일이라면 
			
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_"+originalName;
		
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		
		}
		
		return uploadedFileName;

	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator + cal.get(Calendar.YEAR);

		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);

		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)) ;

		System.out.println(datePath);

		makeDir(uploadPath, yearPath, monthPath, datePath);

		return datePath;

	}

	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
				
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath,String path, String fileName) throws Exception{
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path,fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT,400,200);
		
		String thumbnailName= uploadPath + path + File.separator +"s_" + fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar,'/');

	}
	
}
