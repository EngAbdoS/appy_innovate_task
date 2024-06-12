import 'package:appy_innovate/data/network/error_handler.dart';
import 'package:appy_innovate/data/network/failure.dart';
import 'package:appy_innovate/data/requests/invoiceDetailReuuest.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/data/response/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class FirebaseDataSource {
  Future<Either<Failure, UnitResponse>> postUnit(UnitRequest unit);

  Future<Either<Failure, List<UnitResponse>>> getUnits();

  Future<Either<Failure, bool>> putUnit(UnitRequest unit);

  Future<Either<Failure, bool>> deleteUnit(int id);

  Future<Either<Failure, InvoiceDetailResponse>> postInvoiceDetail(
      InvoiceDetailRequest invoiceDetail);

  Future<Either<Failure, List<InvoiceDetailResponse>>> getInvoiceDetail();

  Future<Either<Failure, bool>> putInvoiceDetail(
      InvoiceDetailRequest invoiceDetail);

  Future<Either<Failure, bool>> deleteInvoiceDetail(int orderNo);
}

class FirebaseDataSourceImplementation implements FirebaseDataSource {
  final FirebaseFirestore firebase;

  FirebaseDataSourceImplementation(this.firebase);

  @override
  Future<Either<Failure, UnitResponse>> postUnit(UnitRequest unit) async {
    try {
      await firebase.collection('Units').add(unit.toJson());
      return Right(UnitResponse(unit.id, unit.name));
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<UnitResponse>>> getUnits() async {
    try {
      var data = await firebase.collection('Units').get();
      return Right(
          data.docs.map((e) => UnitResponse.fromJson(e.data())).toList());
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> putUnit(UnitRequest unit) async {
    try {
      await firebase
          .collection('Units')
          .where('id', isEqualTo: unit.id)
          .get()
          .then((value) => value.docs[0].reference.update(unit.toJson()));
      return const Right(true);
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUnit(int id) async {
    try {
      await firebase
          .collection('Units')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs[0].reference.delete());
      return const Right(true);
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteInvoiceDetail(int orderNo) async {
    try {
      await firebase
          .collection('InvoiceDetail')
          .where('orderNo', isEqualTo: orderNo)
          .get()
          .then((value) => value.docs[0].reference.delete());
      return const Right(true);
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<InvoiceDetailResponse>>>
      getInvoiceDetail() async {
    try {
      var data = await firebase.collection('InvoiceDetail').get();
      return Right(data.docs
          .map((e) => InvoiceDetailResponse.fromJson(e.data()))
          .toList());
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, InvoiceDetailResponse>> postInvoiceDetail(
      InvoiceDetailRequest invoiceDetail) async {
    try {
      await firebase.collection('InvoiceDetail').add(invoiceDetail.toJson());
      return Right(InvoiceDetailResponse(
          invoiceDetail.orderNo,
          invoiceDetail.name,
          UnitResponse(invoiceDetail.unit.id, invoiceDetail.unit.name),
          invoiceDetail.unitNo,
          invoiceDetail.price,
          invoiceDetail.quantity,
          invoiceDetail.total,
          invoiceDetail.creationDate));
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> putInvoiceDetail(
      InvoiceDetailRequest invoiceDetail) async {
    try {
      await firebase
          .collection('InvoiceDetail')
          .where('orderNo', isEqualTo: invoiceDetail.orderNo)
          .get()
          .then((value) =>
              value.docs[0].reference.update(invoiceDetail.toJson()));
      return const Right(true);
    } on FirebaseException catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
