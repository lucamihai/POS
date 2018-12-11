package mainClasses;

public class Product {
    int id;
    String barcode;
    String name;
    String description;
    String imageName;
    float price;
    
    public Product(int id, String barcode, String name, String description, float price){
        this.id = id;
        this.barcode = barcode;
        this.name = name;
        this.description = description;
        this.price = price;
    }
    
    public Product(int id, String barcode, String name, String description, String imageName, float price){
        this.id = id;
        this.barcode = barcode;
        this.name = name;
        this.description = description;
        this.imageName = imageName;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
