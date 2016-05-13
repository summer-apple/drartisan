package com.drartisan.action;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.drartisan.entity.Goods;
import com.drartisan.entity.Subgood;
import com.drartisan.service.impl.ExchangeRateService;
import com.drartisan.service.impl.GoodsService;
import com.drartisan.service.impl.SubgoodsService;
import com.drartisan.service.impl.UtilService;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/util")
public class UtilAction {

	@Autowired
	private GoodsService gs;
	@Autowired
	private SubgoodsService sgs;
	@Autowired
	private UtilService us;


	Logger logger = Logger.getLogger(UtilAction.class);

	@RequestMapping("/upload-image")
	@ResponseBody
	public String uploadImg(HttpServletRequest request, @RequestParam MultipartFile file, int id, int level) {

		String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String filename, url;

		if (level == 1) {// goods-headimg

			Goods goods = gs.qryOne(id);

			filename = goods.getName() + extension;
			url = "resources/images/gallery/" + filename;

			goods.setHeadimg(url);
			gs.update(goods);

		} else if (level == 2) {// subgoods-headimg
			
			Subgood subgood = sgs.qryOne(id);
			Goods goods = gs.qryOne(subgood.getGoodsid());
			
			filename = subgood.getName() + extension;
			url = "resources/images/gallery/" + goods.getName() + "/" + filename;
			
			subgood.setHeadimg(url);
			sgs.update(subgood);
			

		} else {// subgoods-imgs
			
			Subgood subgood = sgs.qryOne(id);
			Goods goods = gs.qryOne(subgood.getGoodsid());
			
			filename = goods.getName() + "-" + subgood.getName() + "-" + us.getRandomString(10).toLowerCase()+ extension;
			url = "resources/images/gallery/" + goods.getName() + "/" + subgood.getName() + "/" + filename;
		}

		logger.info("filename=" + filename);

		logger.info("url=" + url);

		if (!file.isEmpty()) {
			try {
				// 文件保存路径
				String filePath = request.getSession().getServletContext().getRealPath("/") + url;
				File file1 = new File(filePath);
				if (!file1.exists()) {
					file1.mkdirs();
				}
				// 转存文件
				file.transferTo(new File(filePath));
			} catch (IOException e) {
				logger.error(e);
			}
		}
		return url;
	}

	@RequestMapping("/crop")
	@ResponseBody
	public String crop(HttpServletRequest request, int x, int y, int w, int h, String url) throws IOException {

		String srcpath = request.getSession().getServletContext().getRealPath("/") + url;
		String hz = url.substring(url.lastIndexOf(".") + 1);
		FileInputStream is = null;
		ImageInputStream iis = null;
		try {
			// 读取图片文件
			is = new FileInputStream(srcpath);
			/*
			 * 返回包含所有当前已注册 ImageReader 的 Iterator，这些 ImageReader 声称能够解码指定格式。
			 * 参数：formatName - 包含非正式格式名称 . （例如 "jpeg" 或 "tiff"）等 。
			 */
			Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName(hz);
			ImageReader reader = it.next();
			// 获取图片流
			iis = ImageIO.createImageInputStream(is);
			/*
			 * <p>iis:读取源.true:只向前搜索 </p>.将它标记为 ‘只向前搜索’。
			 * 此设置意味着包含在输入源中的图像将只按顺序读取，可能允许 reader 避免缓存包含与以前已经读取的图像关联的数据的那些输入部分。
			 */
			reader.setInput(iis, true);
			/*
			 * <p>描述如何对流进行解码的类<p>.用于指定如何在输入时从 Java Image I/O
			 * 框架的上下文中的流转换一幅图像或一组图像。用于特定图像格式的插件 将从其 ImageReader 实现的
			 * getDefaultReadParam 方法中返回 ImageReadParam 的实例。
			 */
			ImageReadParam param = reader.getDefaultReadParam();
			/*
			 * 图片裁剪区域。Rectangle 指定了坐标空间中的一个区域，通过 Rectangle 对象
			 * 的左上顶点的坐标（x，y）、宽度和高度可以定义这个区域。
			 */
			Rectangle rect = new Rectangle(x, y, w, h);
			// 提供一个 BufferedImage，将其用作解码像素数据的目标。
			param.setSourceRegion(rect);
			/*
			 * 使用所提供的 ImageReadParam 读取通过索引 imageIndex 指定的对象，并将 它作为一个完整的
			 * BufferedImage 返回。
			 */
			BufferedImage bi = reader.read(0, param);
			// 保存新图片
			ImageIO.write(bi, hz, new File(srcpath));

			return "success";
		} finally {
			if (is != null)
				is.close();
			if (iis != null)
				iis.close();
		}
	}
	
}
