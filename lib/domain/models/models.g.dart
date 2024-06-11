// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) => UnitModel(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
    );

Map<String, dynamic> _$UnitModelToJson(UnitModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) =>
    InvoiceDetailModel(
      (json['orderNo'] as num?)?.toInt(),
      json['name'] as String?,
      json['unit'] == null
          ? null
          : UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
      (json['unitNo'] as num?)?.toInt(),
      (json['price'] as num?)?.toDouble(),
      (json['quantity'] as num?)?.toDouble(),
      (json['total'] as num?)?.toDouble(),
      json['creationDate'] as String?,
    );

Map<String, dynamic> _$InvoiceDetailModelToJson(InvoiceDetailModel instance) =>
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
