package pvb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Product")
public class Products {
	@Id
	@Column(name = "Id")
	private int Id;
	@Column(name = "Id_Catalog")
	private int Id_Catalog;
	@Column(name = "Ten")
	private String ten;
	@Column(name = "GiaTien")
	private int giaTien;
	@Column(name = "SoLuong")
	private int soLuong;
	@Column(name = "NoiDung")
	private String noiDung;
	@Column(name = "GiamGia")
	private int giamGia;
	@Column(name = "HinhAnh")
	private String hinhAnh;
	
	public Products() {
		// TODO Auto-generated constructor stub
	}	
	
	public Products(int id, int id_Catalog, String ten, int giaTien, int soLuong, String noiDung, int giamGia,
			String hinhAnh) {
		super();
		Id = id;
		Id_Catalog = id_Catalog;
		this.ten = ten;
		this.giaTien = giaTien;
		this.soLuong = soLuong;
		this.noiDung = noiDung;
		this.giamGia = giamGia;
		this.hinhAnh = hinhAnh;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getId_Catalog() {
		return Id_Catalog;
	}

	public void setId_Catalog(int id_Catalog) {
		Id_Catalog = id_Catalog;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public int getGiaTien() {
		return giaTien;
	}

	public void setGiaTien(int giaTien) {
		this.giaTien = giaTien;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	
	public String getGiaString(long a) {
        String result = "";int j=0;
        String gia = String.valueOf(a);
        for (int i = (gia.length() - 1); i >= 0; i--) {
            if (j%3==0&&j!=0){
                result="."+result;
            }
            result = gia.charAt(i) + result;
            j++;
        }
        return result;
    }
}
