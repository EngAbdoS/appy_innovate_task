import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';


@JsonSerializable()
class UnitResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  UnitResponse (this.id, this.name);

  Map<String, dynamic> toJson() => _$UnitResponseToJson(this);

  factory UnitResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitResponseFromJson(json);
}

@JsonSerializable()
class InvoiceDetailResponse {
  @JsonKey(name: "orderNo")
  int? orderNo;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "unit")
  UnitResponse? unit;
  @JsonKey(name: "unitNo")
  int? unitNo;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "quantity")
  double? quantity;
  @JsonKey(name: "total")
  double? total;
  @JsonKey(name: "creationDate")
  String? creationDate;

  InvoiceDetailResponse(this.orderNo, this.name, this.unit, this.unitNo,
      this.price, this.quantity, this.total, this.creationDate);

  Map<String, dynamic> toJson() => _$InvoiceDetailResponseToJson(this);

  factory InvoiceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailResponseFromJson(json);
}
