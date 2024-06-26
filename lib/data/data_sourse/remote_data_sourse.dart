import 'package:appy_innovate/data/network/app_api.dart';
import 'package:appy_innovate/data/network/error_handler.dart';
import 'package:appy_innovate/data/network/failure.dart';
import 'package:appy_innovate/data/requests/invoiceDetailReuuest.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/data/response/response.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<InvoiceDetailResponse>>> getInvoiceDetail();

  Future<Either<Failure, bool>> putInvoiceDetail(
      InvoiceDetailRequest invoiceDetail);

  Future<Either<Failure, bool>> deleteInvoiceDetail(int orderNo);

  Future<Either<Failure, InvoiceDetailResponse>> postInvoiceDetail(
      InvoiceDetailRequest invoiceDetail);

  Future<Either<Failure, UnitResponse>> postUnit(UnitRequest unit);

  Future<Either<Failure, bool>> putUnit(UnitRequest unit);

  Future<Either<Failure, bool>> deleteUnit(int id);

  Future<Either<Failure, List<UnitResponse>>> getUnits();
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  RemoteDataSourceImplementation(this._appServiceClient);

  final AppServiceClient _appServiceClient;

  @override
  Future<Either<Failure, List<InvoiceDetailResponse>>>
      getInvoiceDetail() async {
    try {
      var result = await _appServiceClient.getInvoiceDetail();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteInvoiceDetail(int orderNo) async {
    try {
      var result = await _appServiceClient.deleteInvoiceDetail(orderNo);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, InvoiceDetailResponse>> postInvoiceDetail(
      InvoiceDetailRequest invoiceDetail) async {
    try {
      var result = await _appServiceClient.postInvoiceDetail(
       invoiceDetail);
      return Right(result);
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> putInvoiceDetail(
      InvoiceDetailRequest invoiceDetail) async {
    try {
      var result = await _appServiceClient.putInvoiceDetail(
     invoiceDetail);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUnit(int id) async {
    try {
      var result = await _appServiceClient.deleteUnit(id);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<UnitResponse>>> getUnits() async {
    try {
      var result = await _appServiceClient.getUnit();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, UnitResponse>> postUnit(UnitRequest unit) async {
    try {
      var result = await _appServiceClient.postUnit(unit.id, unit.name);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> putUnit(UnitRequest unit) async {
    try {
      var result = await _appServiceClient.putUnit(unit.id, unit.name);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
