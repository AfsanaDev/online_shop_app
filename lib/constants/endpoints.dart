class EndPoints {
  static const login = "/oauth/token";
  static const myProductList = "/api/my-products";
  static const productList = "/api/products";
  static const userProductList = "/api/users/{{user_id}}/products";
  static const userList = "/api/users";
  static const createProduct = "/api/my-products";
  static const deleteProduct = "/api/my-products/{{product_id}}";
  static const updateProduct = "/api/my-products/{{product_id}}?_method=PUT";
}
