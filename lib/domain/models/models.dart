import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class UnitModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  UnitModel(this.id, this.name);

  Map<String, dynamic> toJson() => _$UnitModelToJson(this);

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}

@JsonSerializable()
class InvoiceDetailModel {
  @JsonKey(name: "orderNo")
  int? orderNo;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "unit")
  UnitModel? unit;
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

  InvoiceDetailModel(this.orderNo, this.name, this.unit, this.unitNo,
      this.price, this.quantity, this.total, this.creationDate);

  Map<String, dynamic> toJson() => _$InvoiceDetailModelToJson(this);

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);
}
