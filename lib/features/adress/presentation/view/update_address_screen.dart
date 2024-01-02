import 'package:flutter/material.dart';
import 'package:swifit_cart/features/adress/presentation/view/widgets/update_address_screen_body.dart';

import '../../data/model/address_model.dart';

class UpdateAddressScreen extends StatelessWidget {
  const UpdateAddressScreen({Key? key, required this.addressDatum, }) : super(key: key);
  final AddressDatum addressDatum;
  @override
  Widget build(BuildContext context) {
    return  UpdateAddressScreenBody( addressDatum: addressDatum,);
  }
}
