import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

successState(
    {required BuildContext context,
      String lottieAssetPass ='https://lottie.host/8ae458b4-33d5-4530-8d77-aa9c9eb22ac6/x0U3b9Gq3m.json',
      String message = ""}) {
  context.loaderOverlay.visible?context.loaderOverlay.hide():null;
  context.loaderOverlay.show(widgetBuilder: (p) {
    return Stack(
      children: [
        Opacity(
          opacity: .1,
          child: Container(
            color: Colors.lightBlue.withOpacity(0.5),
          ),
        ),
        Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Animate(
                  child: SizedBox(
                    height: 400.h,
                    child: Lottie.network(lottieAssetPass,
                        fit: BoxFit.fill, alignment: Alignment.center),
                  ),
                ).slideX(begin: 1, end: 0.0, curve: Curves.fastEaseInToSlowEaseOut),
                Text(message),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.loaderOverlay.hide();
                    },
                    child: Text("Ok"))
              ],
            )),

      ],
    );
  });
}
