package java_spring_mvc.laptopshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Size(min = 2, message = "Tên sản phẩm không được để trống!!")
    private String name;

    @NotNull
    @DecimalMin(value = "0", inclusive = false, message = "Giá phải lớn hơn 0!!")
    private double price;


    @NotNull
    @Min(message = "Số lượng phải lớn hơn 0!!", value = 1)
    private int quantity;
    private String image;

    @NotNull
    @Column(length = 65555)
    @Size(min = 10, message = "Mô tả chi tiết phải từ 10 kí tự!!")
    private String detailDesc;

    @NotNull
    @Size(min = 2, message = "Mô tả phải từ 2 kí tự!!")
    private String shortDesc;
    private int sold;
    private String factory;
    private String target;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", image='" + image + '\'' +
                ", detailDesc='" + detailDesc + '\'' +
                ", shortDesc='" + shortDesc + '\'' +
                ", sold=" + sold +
                ", factory='" + factory + '\'' +
                ", target='" + target + '\'' +
                '}';
    }
}
