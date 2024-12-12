import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';


Widget shimmerAddressCard() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 17.0),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () {
              // Your onTap logic here
            },
            child: Container(
              height: 127.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kPrimaryColor,
              ),
              child: Row(children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 16.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.location_on_rounded,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Country',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color(0xffDFDFDF),
                          )),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 80, // Set a fixed width for the shimmering text
                        height: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Text('region!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color(0xffDFDFDF),
                          )),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 80, // Set a fixed width for the shimmering text
                        height: 10,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('city',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color(0xffDFDFDF),
                          )),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 100, // Set a fixed width for the shimmering text
                        height: 12,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Text('Street',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color(0xffDFDFDF),
                          )),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 100, // Set a fixed width for the shimmering text
                        height: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    ),
  );
}
