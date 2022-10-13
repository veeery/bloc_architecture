import 'package:bloc_architecture/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseWidgets extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool isScrollable;
  final bool showButton;
  final bool showHeader;
  final Widget? button;
  final Widget? background;
  final Future<bool> Function()? onWillPop;
  final Color? backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;

  BaseWidgets(
      {required this.title,
        required this.children,
        required this.isScrollable,
        this.button,
        this.onWillPop,
        this.backgroundColor,
        this.showHeader = true,
        this.showButton = false,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.background});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: Stack(
            children: [
              background ?? Container(),
              Container(
                padding: showHeader
                    ? EdgeInsets.only(
                    left: 0.05.sw, right: 0.05.sw, top: 0.075.sh)
                    : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showHeader ? _buildBackWidget() : Container(),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        width: 1.sw,
                        child: isScrollable
                            ? ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft:
                            Radius.circular(CurveSize.mediumCurve),
                            topRight:
                            Radius.circular(CurveSize.mediumCurve),
                          ),
                          child: SingleChildScrollView(
                            // physics: BouncingScrollPhysics(),
                            child: _buildChild(context,
                                withButton: showButton),
                          ),
                        )
                            : _buildChild(context, withButton: showButton),
                      ),
                    ),
                  ],
                ),
              ),
              if (MediaQuery.of(context).viewInsets.bottom <= 0)
                Positioned(
                  bottom: 100.w,
                  child: Container(
                    width: 0.425.sw,
                    height: 0.15.sw,
                    margin: EdgeInsets.only(
                      left: 0.5.sw - (0.425.sw / 2),
                      right: 0.5.sw - (0.425.sw / 2),
                    ),
                    child: button,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChild(BuildContext context, {required bool withButton}) {
    if (!withButton) {
      return Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...children,
        if (MediaQuery.of(context).viewInsets.bottom > 0)
          Center(
            child: Container(
              width: 0.425.sw,
              height: 0.15.sw,
              margin: EdgeInsets.symmetric(vertical: 50.h),
              child: button,
            ),
          ),
        if (MediaQuery.of(context).viewInsets.bottom <= 0 && isScrollable)
          SizedBox(height: 400.h),
      ],
    );
  }

  Widget _buildBackWidget() {

    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 25.w),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                // TODO find unfocus on BloC
                // if (onWillPop == null) return Get.back();
                // if (await onWillPop!()) Get.back();
              },
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: FontSize.subHeaderFont, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ],
              ),
            ),
            SizedBox(width: 25.w),
          ],
        ),
        SizedBox(height: 100.h),
      ],
    );

  }
}