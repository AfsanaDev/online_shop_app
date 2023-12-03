class Product {
   late String id;
   late String name;
   late String url ;
   late String stock_quantity ;
   late num price;
   static const blankProducts = "/images/blank_product_picture.png";

  Product(
      {required this.id,
      required this.name,
       required this.url,
        required this.stock_quantity,
      required this.price});
}
