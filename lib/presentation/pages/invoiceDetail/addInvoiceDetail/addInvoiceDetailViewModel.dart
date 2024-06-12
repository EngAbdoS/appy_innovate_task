import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/data/requests/invoiceDetailReuuest.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/baseInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/widgets/errorState.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';
import 'package:appy_innovate/presentation/widgets/successState.dart';
import 'package:intl/intl.dart';

class AddInvoiceDetailViewModel extends BaseInvoiceDetailViewModel {
  final Repository _repo = instance<Repository>();

  addInvoiceDetail(dynamic context) async {
    loadingState(context: context);
    InvoiceDetailRequest req = InvoiceDetailRequest(
      name: invoiceDetailModel.name,
      orderNo: invoiceDetailModel.orderNo,
      unit: UnitRequest(id: super.unitModel.id, name: super.unitModel.name),
      unitNo: invoiceDetailModel.unitNo,
      price: invoiceDetailModel.price,
      quantity: invoiceDetailModel.quantity,
      total: invoiceDetailModel.total,
      creationDate: DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'")
          .format(DateTime.now().toUtc()),
    );

    (await _repo.postInvoiceDetail(req)).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      successState(context: context);
    });
    print("add");
  }
}
