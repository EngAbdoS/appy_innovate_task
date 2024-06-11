class Unit {
  int id;
  String? name;

  Unit({required this.id, this.name});
}

class InvoiceDetail {
  int orderNo;
  String? name;
  Unit unit;
  int unitNo;
  double price;
  double quantity;
  double total;
  String creationDate;

  InvoiceDetail(
      {required this.orderNo,
      required this.name,
      required this.unit,
      required this.unitNo,
      required this.price,
      required this.quantity,
      required this.total,
      required this.creationDate});
}
