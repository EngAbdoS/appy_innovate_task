import 'package:appy_innovate/app/constants.dart';
import 'package:appy_innovate/data/data_sourse/remote_data_sourse.dart';
import 'package:appy_innovate/data/mappers/mappers.dart';
import 'package:appy_innovate/data/network/error_handler.dart';
import 'package:appy_innovate/data/network/failure.dart';
import 'package:appy_innovate/data/requests/invoiceDetailReuuest.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImplementation implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImplementation(this._remoteDataSource);

  @override
  Future<Either<Failure, List<InvoiceDetailModel>>> getInvoiceDetail() async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource.getInvoiceDetail()).fold(
              (error) {
            return Left(error);
          }, (response) {
            if (response.isNotEmpty) {
              var invoiceDetail = response.map((e) => e.toDomain()).toList();
              return Right(invoiceDetail);
            } else {
              return Left(ErrorHandler.handle(response).failure);
            }
          });
        }
      case StorageType.firebase:
        {
          return Right([]);
        }
      case StorageType.localDB:
        {
          return Right([]);
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteInvoiceDetail(int orderNo) async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource.deleteInvoiceDetail(orderNo))
              .fold((error) {
            return Left(error);
          }, (response) {
            return Right(response);
          });
        }
      case StorageType.firebase:
        {
          return Right(false);
        }
      case StorageType.localDB:
        {
          return Right(false);
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUnit(int id) async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource.deleteUnit(id)).fold((error) {
            return Left(error);
          }, (response) {
            return Right(response);
          });
        }
      case StorageType.firebase:
        {
          return Right(false);
        }
      case StorageType.localDB:
        {
          return Right(false);
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<UnitModel>>> getUnits() async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource.getUnits()).fold((error) {
            return Left(error);
          }, (response) {
            if (response.isNotEmpty) {
              var units = response.map((e) => e.toDomain()).toList();
              return Right(units);
            } else {
              return Left(ErrorHandler.handle(response).failure);
            }
          });
        }
      case StorageType.firebase:
        {
          return Right([]);
        }
      case StorageType.localDB:
        {
          return Right([]);
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }

  @override
  Future<Either<Failure, InvoiceDetailModel>> postInvoiceDetail(
      InvoiceDetailRequest invoiceDetail) async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource
                  .postInvoiceDetail(invoiceDetail))
              .fold((error) {
            print("errrrrr");

            return Left(error);
          }, (response) {
            print("res");
            if (response.orderNo != 0) {
              var invoiceDetail = response.toDomain();
              print("res err");

              return Right(invoiceDetail);
            } else {
              print("no res");

              return Left(ErrorHandler.handle(response).failure);
            }
          });
        }
      case StorageType.firebase:
        {
          return Left(DataSource.DEFAULT.getFailure());
        }
      case StorageType.localDB:
        {
          return Left(DataSource.DEFAULT.getFailure());
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }

  @override
  Future<Either<Failure, UnitModel>> postUnit(UnitRequest unit) async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource.postUnit(unit)).fold((error) {
            return Left(error);
          }, (response) {
            if (response.id != 0) {
              var unit = response.toDomain();
              return Right(unit);
            } else {
              return Left(ErrorHandler.handle(response).failure);
            }
          });
        }
      case StorageType.firebase:
        {
          return Left(DataSource.DEFAULT.getFailure());
        }
      case StorageType.localDB:
        {
          return Left(DataSource.DEFAULT.getFailure());
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> putInvoiceDetail(
      InvoiceDetailRequest invoiceDetail) async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource.putInvoiceDetail(invoiceDetail))
              .fold((error) {
            return Left(error);
          }, (response) {
            return Right(response);
          });
        }
      case StorageType.firebase:
        {
          return Right(false);
        }
      case StorageType.localDB:
        {
          return Right(false);
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> putUnit(UnitRequest unit) async {
    switch (defaultStorage) {
      case StorageType.remoteApi:
        {
          return await (await _remoteDataSource.putUnit(unit)).fold((error) {
            return Left(error);
          }, (response) {
            return Right(response);
          });
        }
      case StorageType.firebase:
        {
          return Right(false);
        }
      case StorageType.localDB:
        {
          return Right(false);
        }

      default:
        return Left(DataSource.DEFAULT.getFailure());
    }
  }
}
