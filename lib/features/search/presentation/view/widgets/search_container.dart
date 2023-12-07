import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, required this.word,
  });
final String word;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        color: kPrimaryColor.withOpacity(.1),
      ),
      child: Row(
        children: [
          InkWell(
            child: const Icon(
              Icons.close,
              size: 16,
            ),
            onTap: (){},
          ),
          SizedBox(width: 4.w,),
          Text(
            word,
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
  }
}
