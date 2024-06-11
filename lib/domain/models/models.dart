class UnitModel {
  int id;
  String? name;

  UnitModel({required this.id, this.name});
}

class InvoiceDetailModel {
  int orderNo;
  String? name;
  UnitModel unit;
  int unitNo;
  double price;
  double quantity;
  double total;
  String creationDate;

  InvoiceDetailModel(
      {required this.orderNo,
      this.name,
      required this.unit,
      required this.unitNo,
      required this.price,
      required this.quantity,
      required this.total,
      required this.creationDate});
}
