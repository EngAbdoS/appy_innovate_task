import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:appy_innovate/presentation/pages/put/UnitBaseViewModel.dart';
import 'package:appy_innovate/presentation/widgets/errorState.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';
import 'package:appy_innovate/presentation/widgets/successState.dart';

class DeleteUnitViewModel extends BaseUnitViewModel{

  final Repository _repo = instance<Repository>();



  isUnitIdValid() =>(unitModel.id != 0)?true:false;



  deleteUnit(dynamic context) async {
    loadingState(context: context);

    (await _repo.deleteUnit(unitModel.id)).fold(
            (failure) => {
          errorState(context: context, message: failure.message),
          //TODO create error state
        }, (data) {
      successState(context: context);
    });
    print("add");
  }



}
