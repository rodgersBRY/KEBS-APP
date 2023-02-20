import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> images = [
    "assets/home_bg_2.jpeg",
    "assets/home_bg_3.jpeg",
    "assets/home_bg_4.jpeg",
    "assets/kebs_bg_1.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
          ),
          items: images.map((i) {
            return Builder(builder: (context) {
              return Image.asset(
                i,
                fit: BoxFit.cover,
              );
            });
          }).toList(),
        ));
  }
}
