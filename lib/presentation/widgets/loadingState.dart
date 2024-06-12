import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

loadingState(
    {required BuildContext context,
    String lottieAssetPass ='https://lottie.host/df2eed6b-f24b-4f8b-b113-542683786e2f/1Wl4XfEb8l.json',
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
              child: Lottie.network(lottieAssetPass,
                  fit: BoxFit.cover, alignment: Alignment.center),
            ).slideX(begin: 1, end: 0.0, curve: Curves.fastEaseInToSlowEaseOut),
            Text(message),
          ],
        )),

      ],
    );
  });
}
