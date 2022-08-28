import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/core/colors.dart';
import 'package:machine_test/core/constants.dart';
import 'package:machine_test/view/screens/product_detail_screen.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../controller/login_controller.dart';
import '../widgets/appbar_widget.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final category = [
    'Living Room',
    'Kitchen & Dining',
    'Home Office',
    'Bed Room',
    'Furniture',
    'Kitchen',
  ];
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            kheight25,
            const AppbarWidget(),
            kheight25,
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 30.h,
                      width: 110.w,
                      decoration: const BoxDecoration(
                      color: containerBackgroundcolor,
                      ),
                      child: Center(child: Text(category[index],
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      ),
                    ),
                  ),
                );
                }
              ),
            ),
            kheight35,
            Padding(padding: const EdgeInsets.only(left: 13,right: 13),
            child: GetBuilder<LoginController> (
              init: LoginController(),
              builder: (controller) => controller.products == null
              ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
             crossAxisCount: 2,
             crossAxisSpacing: 10,
             mainAxisSpacing: 30,
             itemCount: controller.products!.length,
             itemBuilder: (context,index) {
               return GestureDetector(
                 child: Container(
                 color: const Color(0xffFFFEFE),
                 child: Stack(
                   children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(controller.products![index].image),
                            ),
                          ),
                          height: (index %2 == 0)
                          ? 170.h
                          : 200.h,
                          width: 180.w,
                        ),
                        kheight15,
                      
                        SizedBox(
                          width: 100.w,
                          child: Text(controller.products![index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                      ],
                     ),
                     Positioned(
                            top: (index % 2 == 0)
                            ? 155.h
                            :185.h,
                            left: 135,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton(onPressed: () {},
                               backgroundColor: Colors.yellow,
                               child: Icon(Icons.add,
                               size: 23.sp,
                               ),
                              ),  
                            ),
                          ),
                          Positioned(
                            top: (index % 2 == 0)
                            ?192.h
                            :222.h,
                            left: 120,
                            child: Text(controller.products![index].price.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15.sp,
                            ),
                            ),
                            ),
                   ],
                 ),
                 ),
                 onTap: () {
                  Get.to(ProductDetailScreen(index: index,));
                 },
               );
             },
             staggeredTileBuilder: (index) {
               return StaggeredTile.count(1, index.isEven ? 1.2 : 1.5);
             }
             ),
            ),
            ),
            
          ],
        ),
      ),
    );
    
  }
}

