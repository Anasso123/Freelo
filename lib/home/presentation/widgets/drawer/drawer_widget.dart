import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelo_ecommerce/core/domain/constants/enums.dart';
import 'package:freelo_ecommerce/core/domain/entities/user.dart';
import 'package:freelo_ecommerce/home/presentation/manager/home_bloc.dart';
import 'package:freelo_ecommerce/home/presentation/widgets/drawer/all_list_tiles.dart';
import 'package:freelo_ecommerce/home/presentation/widgets/drawer/profile_with_props.dart';

class DrawerWidget extends StatelessWidget {
  final double width;
  final User user;

  const DrawerWidget({
    super.key,
    required this.width,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Colors.blue.shade200,
      elevation: 0,
      width: width * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileWithProps(
              image: user.imageUrl,
              width: width,
              height: height,
              onTap: () {},
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Divider(
              color: Colors.black,
              height: 0.01,
            ),
            AllListTiles(
              height: height,
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
