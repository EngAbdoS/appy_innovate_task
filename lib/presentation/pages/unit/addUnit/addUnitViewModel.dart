import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:appy_innovate/presentation/pages/unit/UnitBaseViewModel.dart';
import 'package:appy_innovate/presentation/widgets/errorState.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';
import 'package:appy_innovate/presentation/widgets/successState.dart';

class AddUnitViewModel extends BaseUnitViewModel{
   final Repository _repo = instance<Repository>();

  addUnit(dynamic context) async {
    loadingState(context: context);
    //print(_repo.getInvoiceDetail());
    UnitRequest req = UnitRequest(
      id: unitModel.id,
      name: unitModel.name,
    );

    (await _repo.postUnit(req)).fold(
            (failure) => {
          errorState(context: context, message: failure.message),
          //TODO create error state
        }, (data) {
      successState(context: context);
    });
    print("add");
  }

}
