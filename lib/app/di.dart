import 'package:appy_innovate/data/data_sourse/firebase_data_sourse.dart';
import 'package:appy_innovate/data/data_sourse/remote_data_sourse.dart';
import 'package:appy_innovate/data/network/dio_factory.dart';
import 'package:appy_innovate/data/repository/repository_implementation.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/addInvoiceDetail/addInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/deleteInvoiceDetail/deleteInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/getInvoiceDetail/getInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/putInvoiceDetail/putInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/pages/unit/addUnit/addUnitViewModel.dart';
import 'package:appy_innovate/presentation/pages/unit/deleteUnit/deleteUnitViewModel.dart';
import 'package:appy_innovate/presentation/pages/unit/getUnits/GetUnitsViewModel.dart';
import 'package:appy_innovate/presentation/pages/unit/putUnit/putUnitViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/network/app_api.dart';
import '../presentation/side_menu/side_menu_viewModel/side_menu_viewModel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  instance.registerLazySingleton<FirebaseDataSource>(
      () => FirebaseDataSourceImplementation(instance()));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementation(instance()));
  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementation(instance(), instance()));

  instance.registerLazySingleton<SideMenuViewModel>(() => SideMenuViewModel());
  initInvoiceDetailModule();
  initUnitModule();
}

initInvoiceDetailModule() {
  if (!GetIt.I.isRegistered<AddInvoiceDetailViewModel>()) {
    instance.registerLazySingleton<AddInvoiceDetailViewModel>(
        () => AddInvoiceDetailViewModel());
  }
  if (!GetIt.I.isRegistered<PutInvoiceDetailViewModel>()) {
    instance.registerLazySingleton<PutInvoiceDetailViewModel>(
        () => PutInvoiceDetailViewModel());
  }
  if (!GetIt.I.isRegistered<DeleteInvoiceDetailViewModel>()) {
    instance.registerLazySingleton<DeleteInvoiceDetailViewModel>(
        () => DeleteInvoiceDetailViewModel());
  }
  if (!GetIt.I.isRegistered<GetInvoiceDetailViewModel>()) {
    instance.registerLazySingleton<GetInvoiceDetailViewModel>(
        () => GetInvoiceDetailViewModel());
  }
}

initUnitModule() {
  if (!GetIt.I.isRegistered<AddUnitViewModel>()) {
    instance.registerLazySingleton<AddUnitViewModel>(() => AddUnitViewModel());
  }
  if (!GetIt.I.isRegistered<PutUnitViewModel>()) {
    instance.registerLazySingleton<PutUnitViewModel>(() => PutUnitViewModel());
  }
  if (!GetIt.I.isRegistered<DeleteUnitViewModel>()) {
    instance.registerLazySingleton<DeleteUnitViewModel>(
        () => DeleteUnitViewModel());
  }
  if (!GetIt.I.isRegistered<GetUnitsViewModel>()) {
    instance
        .registerLazySingleton<GetUnitsViewModel>(() => GetUnitsViewModel());
  }
}
