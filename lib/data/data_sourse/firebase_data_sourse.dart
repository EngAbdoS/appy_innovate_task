import 'package:appy_innovate/data/network/error_handler.dart';
import 'package:appy_innovate/data/network/failure.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/data/response/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class FirebaseDataSource {
  Future<Either<Failure, UnitResponse>> postUnit(UnitRequest unit);

  Future<Either<Failure, List<UnitResponse>>> getUnits();

  Future<Either<Failure, bool>> putUnit(UnitRequest unit);
  Future<Either<Failure, bool>> deleteUnit(int id);

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
  Future<Either<Failure, bool>> deleteUnit(int id) async{
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
}
