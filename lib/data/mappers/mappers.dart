import 'package:appy_innovate/data/response/response.dart';
import 'package:appy_innovate/domain/models/models.dart';

extension InvoiceDetailResponseMapper on InvoiceDetailResponse? {
  InvoiceDetailModel toDomain() {
    return InvoiceDetailModel(
      orderNo: this?.orderNo ?? 0,
      name: this?.name ?? "",
      unit: this!.unit.toDomain(),
      unitNo: this?.unitNo ?? 0,
      price: this?.price ?? 0.0,
      quantity: this?.quantity ?? 0.0,
      total: this?.total ?? 0.0,
      creationDate: this?.creationDate ?? "",
    );
  }
}

extension UnitResponseMapper on UnitResponse? {
  UnitModel toDomain() {
    return UnitModel(
      id: this?.id ?? 0,
      name: this?.name ?? "",
    );
  }
}
