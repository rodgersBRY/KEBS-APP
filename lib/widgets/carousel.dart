import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> images = [
    "https://images.unsplash.com/photo-1676616072916-e151e76b3b2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1676412952811-64e55af5ba3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1676583821205-b9f79e3ca783?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1676620172449-142ce7d209bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
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
          ),
          items: images.map((i) {
            return Builder(builder: (context) {
              return Image.network(
                i,
                fit: BoxFit.cover,
              );
            });
          }).toList(),
        ));
  }
}
