import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_cached_network_image.dart';
import 'package:swifit_cart/features/home/data/models/home_model.dart';

class BannersSec extends StatelessWidget {
  const BannersSec({
    super.key,
    required this.banners,
  });

  final List<BannerData> banners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.h),
      child: CarouselSlider(
        items: banners
            .map(
              (e) => CustomCashedNetworkImage(
                imageUrl: e.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: 150.h,
          initialPage: 0,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
