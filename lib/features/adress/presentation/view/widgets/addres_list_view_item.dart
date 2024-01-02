import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import '../../../../../core/utils/functions/navigator_push.dart';
import '../../../data/model/address_model.dart';
import '../update_address_screen.dart';

class AddressListViewItem extends StatelessWidget {
  const AddressListViewItem({Key? key, required this.addressDatum,})
      : super(key: key);

  final AddressDatum addressDatum;
  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () {
              navigatorPush( UpdateAddressScreen(
                addressDatum: addressDatum,
              ), context);
            },
            child: Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kPrimaryColor,
              ),
              child: Row(
                  children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 17.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.location_on_rounded,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
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
                        Text(addressDatum!.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xffDFDFDF),
                              overflow: TextOverflow.ellipsis
                            )),
                        const SizedBox(
                          height: 11,
                        ),
                        const Text('region',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xffDFDFDF),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(addressDatum!.region!,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xffDFDFDF),
                            )),
                      ],
                    ),
                  ),
                ),
                 SizedBox(width: 100.w,),
                Expanded(
                  child: Padding(
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
                        Text(addressDatum!.city!,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xffB5B5B5),
                            )),
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
                        Text(addressDatum!.details!,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xffDFDFDF),
                            )),
                        const SizedBox(
                          height: 11,
                        ),

                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
