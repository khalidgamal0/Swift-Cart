import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/cart/presentation/manger/cart_cubit.dart';
import 'package:swifit_cart/features/product_details/presentation/views/widgets/product_details_first_sec.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';
import 'colors_sec.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({Key? key,
    required this.images,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount, required this.isFavorite, required this.isCart, required this.id, required this.image})
      : super(key: key);
  final List<String>? images;
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
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsFirstSec(
              discount: widget.discount,
              images: widget.images,
              price: widget.price,
              name: widget.name,
              oldPrice: widget.oldPrice,
              isFavorite: widget.isFavorite,
              id: widget.id,
              isCart: widget.isCart,
              image: widget.image,
            ),
            const ColorsSec(),
            const ResponsiveSizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Product details',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                    isDown ? kPrimaryColor : kPrimaryColor.withOpacity(.90),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isDown = !isDown;
                    });
                  },
                  icon: Icon(
                    isDown ? Icons.arrow_upward : Icons.arrow_downward,
                    color: kPrimaryColor.withOpacity(.75),
                    size: 16,
                  ),
                )
              ],
            ),
            if (isDown == true)
              Text(
                widget.description,
                style: Styles.textStyle16.copyWith(color: Colors.grey[800]),
                textAlign: TextAlign.start,
              ),
            const ResponsiveSizedBox(
              height: 32.98,
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return state is ChangeCartLoading?const Center(child: CircularProgressIndicator(color: kPrimaryColor,)) :CustomButton(
                    buttonName: 'Add to cart', onPressed: () {
                  CartCubit.get(context).changeCart(id: widget.id);
                });
              },
            ),
            const ResponsiveSizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
