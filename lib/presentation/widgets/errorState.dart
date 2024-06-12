import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

errorState(
    {required BuildContext context,
      String lottieAssetPass ='https://lottie.host/27e48f10-a34a-47b9-bc83-62be78c4d9a8/Bze6d3XeHf.json',
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
                SizedBox(
                  height: 20,
                ), Text(message),
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
