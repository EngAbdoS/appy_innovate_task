import 'package:appy_innovate/data/network/failure.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImplementation implements Repository
{
  @override
  Future<Either<Failure, bool>> deleteInvoiceDetail(int orderNo) {
    // TODO: implement deleteInvoiceDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteUnit(int id) {
    // TODO: implement deleteUnit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<InvoiceDetailModel>>> getInvoiceDetail() {
    // TODO: implement getInvoiceDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UnitModel>>> getUnits() {
    // TODO: implement getUnits
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, InvoiceDetailModel>> postInvoiceDetail(InvoiceDetailModel invoiceDetail) {
    // TODO: implement postInvoiceDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UnitModel>> postUnit(UnitModel unit) {
    // TODO: implement postUnit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> putInvoiceDetail(InvoiceDetailModel invoiceDetail) {
    // TODO: implement putInvoiceDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> putUnit(UnitModel unit) {
    // TODO: implement putUnit
    throw UnimplementedError();
  }
  
  
  
  
}