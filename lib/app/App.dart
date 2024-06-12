import 'package:appy_innovate/app/constants.dart';
import 'package:appy_innovate/presentation/mainPage.dart';
import 'package:appy_innovate/presentation/side_menu/side_menu_view/side_menu_view.dart';
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
            inputDecorationTheme: const InputDecorationTheme(

              contentPadding: EdgeInsets.all(8),
              hintStyle:
              TextStyle(
                color: Color(0xffCCBEBE),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )
                ,
              labelStyle:   TextStyle(
                color: Color(0xffCCBEBE),
              fontSize: 12,
              fontWeight: FontWeight.w600
          ),

              enabledBorder:  OutlineInputBorder(
                borderSide:
                BorderSide(color: Color(0xffCCBEBE), width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlue, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlue, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              errorBorder:  OutlineInputBorder(
                borderSide:                 BorderSide(color: Colors.red, width: 1.5),

                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),

            ),
            primarySwatch: Colors.blue,

          ),
          home:   SideMenuView(),
        ),
      ),
    );
  }
}
