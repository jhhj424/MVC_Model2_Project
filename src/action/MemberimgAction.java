package action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class MemberimgAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") + "model2/member/img/";
		MultipartRequest multi = new MultipartRequest(request, path,10*1024*1024,"euc-kr");
		boolean imgable = multi.getContentType("picture").contains("image");
		if(!imgable) {
			request.setAttribute("msg", "�̹������ϸ� ���ε� �����մϴ�");
			request.setAttribute("url", "memberimgForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		String filename = multi.getFilesystemName("picture");
		ParameterBlock pb = new ParameterBlock();
		pb.add(path + filename);
		RenderedOp rop = JAI.create("fileload", pb);
		BufferedImage bi = rop.getAsBufferedImage();
		int width = bi.getWidth();
		int height = bi.getHeight();
		if(width * height > 10000) {
			width = width/5;//�����̹����� ������ 5����1�� ����
			height = height/5;} //�����̹����� ������ 5����1�� ����
		BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = thumb.createGraphics();
		g.drawImage(bi, 0, 0, width, height, null);
		File f = new File(path+"sm_"+filename);
		ImageIO.write(thumb, "jpg", f);
		request.setAttribute("filename", filename);
		return new ActionForward(false, "memberimg.jsp");
	}
}
