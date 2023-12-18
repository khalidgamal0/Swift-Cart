import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_cached_network_image.dart';


class BrandListViewItem extends StatelessWidget {
  const BrandListViewItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40.w,
      backgroundColor: Colors.white,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(
          40.w,
        ),
        child: CustomCashedNetworkImage(imageUrl: image, fit: BoxFit.cover),
      ),
    );
  }
}
