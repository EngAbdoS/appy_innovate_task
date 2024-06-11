import 'package:appy_innovate/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';


@RestApi(baseUrl: AppConstants.baseUrl) //annotation
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

}
  