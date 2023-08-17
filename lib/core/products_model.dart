class ProductModel {
  final int id;
  final String name;
  final String modelNo;
  final double price;
  final double rating;
  final int ratingCount;
  final String description;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.modelNo,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.images,
  });
}

List<ProductModel> demoProducts = [
  ProductModel(
    id: 0,
    name: 'Studio 3 Wireless',
    modelNo: 'Mi-Cc-790',
    price: 369,
    rating: 3,
    ratingCount: 89,
    description:
        'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
    images: [
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
    ],
  ),
  ProductModel(
    id: 1,
    name: 'Business Book Cover',
    modelNo: 'Tionic-G80',
    price: 299,
    rating: 4,
    ratingCount: 89,
    description:
        'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
    images: [
      'https://marketplace.canva.com/EAFersXpW3g/1/0/1003w/canva-blue-and-white-modern-business-book-cover-cfxNJXYre8I.jpg',
      'https://marketplace.canva.com/EAFersXpW3g/1/0/1003w/canva-blue-and-white-modern-business-book-cover-cfxNJXYre8I.jpg',
      'https://marketplace.canva.com/EAFersXpW3g/1/0/1003w/canva-blue-and-white-modern-business-book-cover-cfxNJXYre8I.jpg',

    ],
  ),
  ProductModel(
    id: 3,
    name: 'Studio 7 Wireless',
    modelNo: 'Tionic-G80',
    price: 299,
    rating: 4,
    ratingCount: 89,
    description:
        'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
    images: [
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
    ],
  ),
  ProductModel(
    id: 4,
    name: 'Studio 7 Wireless',
    modelNo: 'Tionic-G80',
    price: 299,
    rating: 4,
    ratingCount: 89,
    description:
        'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
    images: [
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
    ],
  ),
  ProductModel(
    id: 5,
    name: 'Studio 7 Wireless',
    modelNo: 'Tionic-G80',
    price: 299,
    rating: 4,
    ratingCount: 89,
    description:
        'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
    images: [
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
      'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
    ],
  ),
];

List<ProductModel> bestSelling = [
  ProductModel(
    id: 3,
    name: 'Studio 7 Wireless',
    modelNo: 'Tionic-G80',
    price: 299,
    rating: 4,
    ratingCount: 89,
    description:
        'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
    images: [
      'assets/images/headphone3.png',
      'assets/images/headphone3.png',
      'assets/images/headphone3.png',
    ],
  ),
];
