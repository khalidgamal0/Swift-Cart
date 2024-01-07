import 'package:flutter/material.dart';

import '../../../../../core/widgets/responsive_sized_box.dart';
import 'color_container.dart';

class ColorsSec extends StatelessWidget {
  const ColorsSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Row(children: [
      ColorContainerItem(
        color: Color(0xffA1C89B),text: 'Green',width: 79,
      ),
      ResponsiveSizedBox(
        width: 16,
      ),
      ColorContainerItem(
        color: Color(0xff7485C1),text: 'Sky Blue',width: 94,

      ),
      ResponsiveSizedBox(
        width: 16,
      ),
      ColorContainerItem(
        color: Color(0xffC9A19C),text: 'Rose ',width: 80,

      ),

    ],);
  }
}
