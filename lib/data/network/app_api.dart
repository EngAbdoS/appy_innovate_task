import 'package:appy_innovate/app/constants.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl) //annotation
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  /// InvoiceDetail endPoints
  @POST("/InvoiceDetail")
  Future<InvoiceDetailModel> postInvoiceDetail(
    @Field("orderNo") int orderNo,
    @Field("name") String? name,
    @Field("unit") UnitModel unit,
    @Field("unitNo") int unitNo,
    @Field("price") double price,
    @Field("quantity") double quantity,
    @Field("total") double total,
    @Field("creationDate") String creationDate,
  );

  @PUT("/InvoiceDetail")
  Future<bool> putInvoiceDetail(
    @Field("orderNo") int orderNo,
    @Field("name") String? name,
    @Field("unit") UnitModel unit,
    @Field("unitNo") int unitNo,
    @Field("price") double price,
    @Field("quantity") double quantity,
    @Field("total") double total,
    @Field("creationDate") String creationDate,
  );

  @DELETE("/InvoiceDetail")
  Future<bool> deleteInvoiceDetail(
    @Field("orderNo") int orderNo,
  );

  @GET("/InvoiceDetail")
  Future<List<InvoiceDetailModel>> getInvoiceDetail();

  /// unit endPoints

  @POST("/Unit")
  Future<UnitModel> postUnit(
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
  Future<List<UnitModel>> getUnit();
}
