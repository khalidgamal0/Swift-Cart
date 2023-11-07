import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          var cubit=LayoutCubit.get(context);
          return Scaffold(
            body:cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(

              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined,), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined,), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined,), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outlined,), label: ''),
              ],
              //
            ),

          );
        },
      ),
    );
  }
}
