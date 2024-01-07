import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeGridViewItemLoading extends StatelessWidget {
  const HomeGridViewItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 160.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                color: Colors.white, // Set a background color to avoid shimmer artifacts
                width: 25.w,
                height: 10.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Container(
                  color: Colors.white, // Set a background color to avoid shimmer artifacts
                  width: double.infinity,
                  height: 144.h,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 12.h,
                    width: 60.w,
                    child: Container(
                      color: Colors.white, // Set a background color to avoid shimmer artifacts
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 12.h,
                    width: 40.w,
                    child: Container(
                      color: Colors.white, // Set a background color to avoid shimmer artifacts
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 16.h,
                width: 150.w,
                child: Container(
                  color: Colors.white, // Set a background color to avoid shimmer artifacts
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 16.h,
                width: 150.w,
                child: Container(
                  color: Colors.white, // Set a background color to avoid shimmer artifacts
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
