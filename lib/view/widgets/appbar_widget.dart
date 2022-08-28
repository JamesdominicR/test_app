import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Discover',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w600,
          ),
          ), 
           Badge(
            badgeContent: const Text('3',
            style: TextStyle(
              color: kwhite,
              fontSize: 15,
            ),
            ),
            position: BadgePosition.topEnd(top: 2,end: 2),
           
            shape: BadgeShape.circle,
            badgeColor: Colors.yellow,
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined,
              size: 30,
              ),
              onPressed: () {},
            ),
           ),
          ],
      ),
    );
  }
}