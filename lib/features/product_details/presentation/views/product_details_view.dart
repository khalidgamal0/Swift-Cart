import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/features/product_details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView(
      {Key? key,
       this.images,
      required this.name,
      required this.description,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.isFavorite,
      required this.isCart,
      required this.id, required this.image})
      : super(key: key);
  final List<String> ?images;
  final String name;
  final String description;
  final String price;
  final String image;
  final String oldPrice;
  final int discount;
  final bool isFavorite;
  final bool isCart;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        title: Text(name),
        actions: [
          const Icon(Icons.shopping_cart_outlined),
          SizedBox(
            width: 24.w,
          )
        ],
      ),
      body: ProductDetailsViewBody(
        discount: discount,
        images: images,
        price: price,
        name: name,
        oldPrice: oldPrice,
        description: description,
        isFavorite: isFavorite,
        isCart: isCart,
        id: id, image:image,
      ),
    );
  }
}
