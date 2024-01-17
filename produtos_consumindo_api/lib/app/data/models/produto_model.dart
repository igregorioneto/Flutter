class ProdutoModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProdutoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      rating: map['rating'],
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: map['images'],
    );
  }
}
