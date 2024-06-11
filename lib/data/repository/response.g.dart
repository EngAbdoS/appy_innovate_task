// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitResponse _$UnitResponseFromJson(Map<String, dynamic> json) => UnitResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
    );

Map<String, dynamic> _$UnitResponseToJson(UnitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

InvoiceDetailResponse _$InvoiceDetailResponseFromJson(
        Map<String, dynamic> json) =>
    InvoiceDetailResponse(
      (json['orderNo'] as num?)?.toInt(),
      json['name'] as String?,
      json['unit'] == null
          ? null
          : UnitResponse.fromJson(json['unit'] as Map<String, dynamic>),
      (json['unitNo'] as num?)?.toInt(),
      (json['price'] as num?)?.toDouble(),
      (json['quantity'] as num?)?.toDouble(),
      (json['total'] as num?)?.toDouble(),
      json['creationDate'] as String?,
    );

Map<String, dynamic> _$InvoiceDetailResponseToJson(
        InvoiceDetailResponse instance) =>
    <String, dynamic>{
      'orderNo': instance.orderNo,
      'name': instance.name,
      'unit': instance.unit,
      'unitNo': instance.unitNo,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'creationDate': instance.creationDate,
    };
