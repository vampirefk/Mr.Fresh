package fresh;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class toOrder
 */
@WebServlet("/toOrder")
public class toOrder extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		String[] goodno=request.getParameterValues("goodno");
		String[] pic=request.getParameterValues("pic");
		String[] userno=request.getParameterValues("userno");
		String[] goodname=request.getParameterValues("goodname");
		String[] price=request.getParameterValues("price");
		String[] num=request.getParameterValues("num");
		String[] totalprice=request.getParameterValues("totalprice");
		String[] note=request.getParameterValues("note");
		String province=request.getParameter("prov");
		String city=request.getParameter("city");
		String county=request.getParameter("country");
		String detailAddr=request.getParameter("detailAddr");
		ArrayList<Order> list=new ArrayList<>();
		try {
			UserDao userdao=new UserDao();
			for(int i=0;i<goodno.length;i++) {
				Order order = new Order();
				order.setGoodno(Integer.parseInt(goodno[i]));
				order.setUserno(userno[i]);
				order.setPic(Byte.parseByte(pic[i]));
				order.setGoodname(goodname[i]);
				System.out.println(goodname[i]);
				order.setPrice(Float.parseFloat(price[i]));
				order.setNum(Integer.parseInt(num[i]));
				order.setTotalprice(Float.parseFloat(totalprice[i]));
				order.setNote(note[i]);
				order.setProvince(province);
				System.out.println(province);
				order.setCity(city);
				System.out.println(city);
				order.setCounty(county);
				System.out.println(county);
				order.setdetailAddr(detailAddr);
				System.out.println(detailAddr);
				list.add(order);
			}
			userdao.toOrder(list);
			request.getRequestDispatcher("order.jsp").forward(request,response);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！toOrder払移�　�！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！");
		}
		
		
	}

}
