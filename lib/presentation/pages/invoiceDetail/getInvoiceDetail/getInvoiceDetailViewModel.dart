import 'dart:async';
import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/presentation/widgets/errorState.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';
import 'package:appy_innovate/presentation/widgets/successState.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../domain/repository/repository.dart';

class GetInvoiceDetailViewModel {
  final Repository _repo = instance<Repository>();
  final StreamController _invoiceDetailListStreamController = BehaviorSubject<List<InvoiceDetailModel>>();


  Sink get invoiceDetailListSink => _invoiceDetailListStreamController.sink;


  Stream<List<InvoiceDetailModel>> get outputInvoiceDetailList =>
      _invoiceDetailListStreamController.stream.map((list) => list);


  List<InvoiceDetailModel> invoiceDetailList = [];

  getInvoiceDetail(dynamic context) async {
    loadingState(context: context);
    //print(_repo.getInvoiceDetail());

    (await _repo.getInvoiceDetail()).fold(
            (failure) => {
          errorState(context: context, message: failure.message),
          //TODO create error state
        }, (data) {
      invoiceDetailList = data;
      invoiceDetailListSink.add(invoiceDetailList);
      print(invoiceDetailList[0]);
      successState(context: context);
    });
    print("add");
  }
}
