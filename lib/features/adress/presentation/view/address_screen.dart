import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/core/utils/service_locator.dart';
import 'package:swifit_cart/features/adress/data/repo/address_repo_fimpl.dart';
import 'package:swifit_cart/features/adress/presentation/view/widgets/address_screen_body.dart';
import '../manger/address_cubit.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AddressScreenBody();
  }
}
