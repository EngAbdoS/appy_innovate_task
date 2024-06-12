import 'package:appy_innovate/data/requests/unitRequest.dart';

class InvoiceDetailRequest {
  final int orderNo;
  final String? name;
  final UnitRequest unit;
  final int unitNo;
  final double price;
  final double quantity;
  final double total;
  final String creationDate;

  InvoiceDetailRequest({
    required this.orderNo,
    this.name,
    required this.unit,
    required this.unitNo,
    required this.price,
    required this.quantity,
    required this.total,
    required this.creationDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderNo': orderNo,
      'name': name,
      'unit': unit.toJson(),
      'unitNo': unitNo,
      'price': price,
      'quantity': quantity,
      'total': total,
      'creationDate': creationDate,
    };
  }
}
