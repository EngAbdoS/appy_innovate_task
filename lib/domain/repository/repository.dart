import 'package:appy_innovate/data/network/failure.dart';
import 'package:appy_innovate/data/requests/invoiceDetailReuuest.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {

  //InvoiceDetail

  Future<Either<Failure, InvoiceDetailModel>> postInvoiceDetail(
      InvoiceDetailRequest invoiceDetail);

  Future<Either<Failure, bool>> putInvoiceDetail(
      InvoiceDetailRequest invoiceDetail);

  Future<Either<Failure, bool>> deleteInvoiceDetail(int orderNo);

  Future<Either<Failure, List<InvoiceDetailModel>>> getInvoiceDetail();

  //Unit

  Future<Either<Failure, UnitModel>> postUnit(UnitModel unit);

  Future<Either<Failure, bool>> putUnit(UnitModel unit);

  Future<Either<Failure, bool>> deleteUnit(int id);

  Future<Either<Failure, List<UnitModel>>> getUnits();
}
