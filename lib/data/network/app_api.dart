import 'package:appy_innovate/app/constants.dart';
import 'package:appy_innovate/data/requests/invoiceDetailReuuest.dart';
import 'package:appy_innovate/data/response/response.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl) //annotation
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  /// InvoiceDetail endPoints
  @POST("/InvoiceDetail")
  Future<InvoiceDetailResponse> postInvoiceDetail(
      @Body() InvoiceDetailRequest request
  );

  @PUT("/InvoiceDetail")
  Future<bool> putInvoiceDetail(
      @Body() InvoiceDetailRequest request
  );

  @DELETE("/InvoiceDetail")
  Future<bool> deleteInvoiceDetail(
    @Field("orderNo") int orderNo,
  );

  @GET("/InvoiceDetail")
  Future<List<InvoiceDetailResponse>> getInvoiceDetail();

  /// unit endPoints

  @POST("/Unit")
  Future<UnitResponse> postUnit(
    @Field("id") int id,
    @Field("name") String? name,
  );

  @PUT("/Unit")
  Future<bool> putUnit(
    @Field("id") int id,
    @Field("name") String? name,
  );

  @DELETE("/Unit")
  Future<bool> deleteUnit(
    @Field("unitId") int unitId,
  );

  @GET("/Unit")
  Future<List<UnitResponse>> getUnit();
}
