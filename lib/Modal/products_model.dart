class Product {
  final String image, title, description, price, brand;
  final int size;

  Product(
      {required this.image,
      required this.title,
      required this.brand,
      required this.description,
      required this.price,
      required this.size});
}

List<Product> products = [
  Product(
      image: "assets/second (1).png",
      title: "Nike ",
      brand: 'Air Max 270',
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
      price: "\$299.99",
      size: 7),
  Product(
      image: "assets/second (2).png",
      title: "Adidas ",
      brand: 'Air Force 1',
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
      price: "\$199.99",
      size: 8),
  Product(
      image: "assets/second (1).png",
      title: "Puma ",
      brand: 'Air Force 1',
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
      price: "\$399.99",
      size: 9),
  Product(
      image: "assets/second (2).png",
      title: "Rebok ",
      brand: 'Air Max 270',
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
      price: "\$299.99",
      size: 10),
  Product(
      image: "assets/second (1).png",
      title: "Sketcher ",
      brand: 'Air Force 1',
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
      price: "\$299.99",
      size: 11),
  Product(
      image: "assets/second (2).png",
      title: "Hummel",
      brand: 'Air Max 270',
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
      price: "\$299.99",
      size: 12),
];
