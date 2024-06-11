import 'package:appy_innovate/data/network/app_api.dart';
import 'package:appy_innovate/data/network/error_handler.dart';
import 'package:appy_innovate/data/network/failure.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<InvoiceDetailModel>>> getInvoiceDetail();
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  RemoteDataSourceImplementation(this._appServiceClient);

  final AppServiceClient _appServiceClient;

  @override
  Future<Either<Failure, List<InvoiceDetailModel>>> getInvoiceDetail() async {
    try {
      var result = await _appServiceClient.getInvoiceDetail();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
