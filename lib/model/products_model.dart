import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "General",
      image: "assets/images/E.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Life Hacks",
      image: "assets/images/E2.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 3,
      title: "Animals",
      image: "assets/images/E1.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 4,
      title: "Sport",
      image: "assets/images/E3.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 5,
      title: "Sex",
      image: "assets/images/E4.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 6,
      title: "Science",
      image: "assets/images/E6.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 7,
      title: "Human Body",
      image: "assets/images/E5.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 8,
      title: "Universe",
      image: "assets/images/E7.png",
      color: Color(0xFF3D82AE)),
];
