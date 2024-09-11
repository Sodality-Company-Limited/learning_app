import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;

class PictureSlider extends StatelessWidget {
  final List<String> imageList;
  const PictureSlider({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return carousel_slider.CarouselSlider(
      items: imageList
          .map((item) => ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ))
          .toList(),
      options: carousel_slider.CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        viewportFraction: 0.8,
      ),
    );
  }
}
