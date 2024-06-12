import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';

import '../../../../app/di.dart';
import '../../../widgets/errorState.dart';
import '../../../widgets/successState.dart';
import '../baseInvoiceDetailViewModel.dart';

class DeleteInvoiceDetailViewModel extends BaseInvoiceDetailViewModel {
 final Repository _repo = instance<Repository>();

 bool isOrderNoValid() => invoiceDetailModel.orderNo != 0;

  deleteInvoiceDetail(dynamic context) async {
   loadingState(context: context);

   (await _repo.deleteInvoiceDetail(invoiceDetailModel.orderNo)).fold(
           (failure) => {
        errorState(context: context, message: failure.message),
        //TODO create error state
       }, (data) {
    successState(context: context);
   });
   print("add");
  }


}
