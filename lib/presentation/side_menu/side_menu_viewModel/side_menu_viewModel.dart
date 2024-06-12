import 'dart:async';

import 'package:appy_innovate/presentation/mainPage.dart';
import 'package:appy_innovate/presentation/pages/addInvoiceDetail/addInvoiceDetailView.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideMenuViewModel with SideMenuViewModelInput, SideMenuViewModelOutPut {
  final StreamController _currentPageWidgetStreamController =
      BehaviorSubject<int>();

  @override
  Sink get currentPageWidgetSink => _currentPageWidgetStreamController.sink;

  @override
  Stream<int> get currentPageWidgetStream =>
      _currentPageWidgetStreamController.stream.map((e) => e);

  @override
 void changePageWidget(int pageIndex) {
   print(pageIndex);
   currentPageWidgetSink.add(pageIndex);
   //list of page to stream



  }
  dispose() {
    _currentPageWidgetStreamController.close();
  }

}

abstract mixin class SideMenuViewModelInput {
  Sink get currentPageWidgetSink;
void  changePageWidget(int pageIndex) ;
}

abstract mixin class SideMenuViewModelOutPut {
  Stream<int> get currentPageWidgetStream;
}
