import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List _statements = [
    {
      "title": "Vision",
      "image_icon": 'assets/vision_icon.png',
      "desc":
          "To be a global leader in standards based solutions that deliver quality and confidence",
    },
    {
      "title": "Mission",
      "image_icon": "assets/mission_icon.png",
      "desc":
          "To provide standard based solutions hat promote innovation, trade and quality life"
    },
    {
      "title": "Motto",
      "image_icon": "assets/motto_icon.png",
      "desc": "Standards for Quality Life"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.8,
            height: 200,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
          ),
          items: _statements.map((i) {
            return Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        color: Colors.white,
                        width: 50,
                        image: AssetImage(i['image_icon']),
                      ),
                      Gap(5),
                      Text(
                        i['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Gap(5),
                      Text(
                        i['desc'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            });
          }).toList(),
        ));
  }
}
