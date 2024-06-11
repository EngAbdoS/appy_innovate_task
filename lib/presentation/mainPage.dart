import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/data/data_sourse/remote_data_sourse.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});

  final RemoteDataSource remoteDataSource =instance<RemoteDataSource>();

  @override
  Widget build(BuildContext context) {
    print(remoteDataSource.getInvoiceDetail());
    return Scaffold(





    );
  }
}
