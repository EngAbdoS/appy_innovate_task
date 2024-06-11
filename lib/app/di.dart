import 'package:appy_innovate/data/data_sourse/remote_data_sourse.dart';
import 'package:appy_innovate/data/network/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/network/app_api.dart';
import '../presentation/side_menu/side_menu_viewModel/side_menu_viewModel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementation(instance()));
  instance.registerLazySingleton<SideMenuViewModel>(
      () => SideMenuViewModel());
}
