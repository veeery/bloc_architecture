
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_text/skeleton_text.dart';

class LoadingList extends StatelessWidget {

  int maxCount = 4;
  int minCount = 2;
  double minWidth = 100.w;
  double maxWidth = 200.w;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: minCount + Random().nextInt(maxCount),
      itemBuilder: (context, index) {
        return Container(
          height: 200.h,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              Expanded(
                child: SkeletonAnimation(
                  shimmerColor: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  shimmerDuration: 1000,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    margin: EdgeInsets.only(top: 3.h, left: 5.w, bottom: 3.h),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: SkeletonAnimation(
                        borderRadius: BorderRadius.circular(10.0),
                        shimmerColor: index % 2 != 0 ? Colors.grey : Colors.white54,
                        child: Container(
                          height: 4.h,
                          width: minWidth + Random().nextInt(maxWidth.toInt()),
                          //width: MediaQuery.of(context).size.width * 0.09.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Padding(
                        padding : EdgeInsets.only(right: 10.w),
                        child: SkeletonAnimation(
                          borderRadius: BorderRadius.circular(10.0),
                          shimmerColor: index % 2 != 0 ? Colors.grey : Colors.white54,
                          child: Container(
                            width: minWidth + Random().nextInt(maxWidth.toInt()),
                            height: 4.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[300]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
