package cn.carrent.action;

import com.opensymphony.xwork2.ActionSupport;

import cn.carrent.pojo.Car;
import cn.carrent.service.ICarService;

public class CarAction extends ActionSupport {
	private ICarService carService;
	private Integer cid;
	private String brand;
	private String model;
	private boolean state;
	private double baseprice;
	private double carrent;

	public void setCarService(ICarService carService) {
		this.carService = carService;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public void setBaseprice(double baseprice) {
		this.baseprice = baseprice;
	}

	public void setCarrent(double carrent) {
		this.carrent = carrent;
	}

	// ≤È—Ø≥µ¡æ
	public String queryCar() {
		Car car=new Car(cid, brand, model, state, baseprice, carrent);
//		pb=
//			BookType bookType = new BookType();
//			bookType.setBookTypeId(bookTypeId);
//			Book book = new Book(ISBN, bookType, bookName, autho, press);
//			pb = bookService.queryBook(book, pageCode, pageSize);
//		}
//		if (pb != null) {
//			pb.setUrl("queryBook.action?ISBN=" + ISBN + "&bookName=" + bookName + "&bookTypeId=" + bookTypeId
//					+ "&press=" + press + "&autho=" + autho + "&");
//		}
//		ServletActionContext.getRequest().setAttribute("pb", pb);
		return "success";
	}
}
