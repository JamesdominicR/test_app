import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/core/colors.dart';
import 'package:machine_test/core/constants.dart';

import '../../controller/login_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  final int index;
   ProductDetailScreen({Key? key,required this.index}) : super(key: key);
   final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Living Room',
        style: TextStyle(
          fontSize: 25,
        ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                kheight10,
                Container(
                  height: 350.h,
                  width: 364.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(controller.products![index].image)),
                  ),
                ),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Rating',
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500  
                    ),
                    ),
                   kwidth5,
                    RatingBarIndicator(
                    rating: 3.5,
                    itemBuilder: ((context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )),
                    itemCount: 5,
                    itemSize: 16,

                    ),
                  ],
                ),
                kheight20,
                Text('Remark Arm chair\nYellow',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500
                ),
                ),
                kheight5,
                const Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                ),
                kheight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$126.34',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.w,
                          color: containerBackgroundcolor,
                          ),
                        ),
                        child: Center(
                          child: Text('Add to Cart',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                         
                          ),
                          ),
                        ),
                      ),
                    ),
                     GestureDetector(
                       child: Container(
                        height: 40.h,
                        width: 100.w,
                        color: Colors.yellow,
                        child: Center(
                          child: Text('Buy Now',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: kwhite,
                          ),
                          ),
                        ),
                        ),
                        onTap: () async{
                         await AwesomeNotifications().createNotification(
                          content: NotificationContent(
                         id: index,
                         channelKey: "basic_channel",
                         title: controller.products![index].title,
                         body: controller.products![index].price.toString(),
                         bigPicture:  controller.products![index].image,
                         notificationLayout: NotificationLayout.BigPicture

                         ));
                        },
                     ),
                  ],
                ),

                ],
              ),
              Positioned(
                top: 345,
                left: 310,
                child: SizedBox(
                                height: 30,
                                width: 30,
                                child: FloatingActionButton(onPressed: () {},
                                 backgroundColor: Colors.yellow,
                                 child: Icon(Icons.close,
                                 size: 15,
                                 ),
                                ),  
                              ),
              ),
              Positioned(
                top: 345,
                left: 265,
                child: SizedBox(
                                height: 30,
                                width: 30,
                                child: FloatingActionButton(onPressed: () {},
                                 backgroundColor: Colors.yellow,
                                 child: Icon(Icons.favorite_outline,
                                 size: 15,
                                 ),
                                ),  
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}