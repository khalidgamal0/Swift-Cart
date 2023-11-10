import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Banners extends StatelessWidget {
  const Banners({
    super.key,
    required this.x,
  });

  final List x;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.h),
      child: CarouselSlider(
          items: x
              .map((e) => Image(
            image: AssetImage(e),
            fit: BoxFit.cover,
            width: double.infinity,
          ))
              .toList(),
          options: CarouselOptions(
              height: 150.h,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              // scrollDirection: Axis.horizontal,
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: .8)),
    );
  }
}
