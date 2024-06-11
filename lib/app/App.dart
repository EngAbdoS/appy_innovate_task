import 'package:appy_innovate/app/constants.dart';
import 'package:appy_innovate/presentation/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: ScreenUtilInit(
        designSize: AppConstants.appDesignSize,
        minTextAdapt: true,
        splitScreenMode: true,

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,

          ),
          home:  MainPage(),
        ),
      ),
    );
  }
}
