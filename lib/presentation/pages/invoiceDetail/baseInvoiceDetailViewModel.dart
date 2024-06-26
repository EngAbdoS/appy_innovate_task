import 'dart:async';
import 'package:appy_innovate/app/extentions.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/presentation/pages/unit/UnitBaseViewModel.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseInvoiceDetailViewModel extends BaseUnitViewModel {
  final StreamController _orderNoStreamController = BehaviorSubject<int>();
  final StreamController _invoiceNameStreamController =
  BehaviorSubject<String>();
  final StreamController _unitNoStreamController = BehaviorSubject<int>();
  final StreamController _priceStreamController = BehaviorSubject<double>();
  final StreamController _quantityStreamController = BehaviorSubject<double>();
  final StreamController _totalStreamController = BehaviorSubject<double>();
  final StreamController _creationDateStreamController =
  BehaviorSubject<String>();
  final StreamController _invoiceDetailValidationStreamController =
  BehaviorSubject<bool?>();


  InvoiceDetailModel invoiceDetailModel = InvoiceDetailModel(
      orderNo: 0,
      unit: UnitModel(id: 0),
      unitNo: 0,
      price: 0,
      quantity: 0,
      total: 0,
      creationDate: "");

  Sink get orderNoSink => _orderNoStreamController.sink;

  Sink get invoiceNameSink => _invoiceNameStreamController.sink;

  Sink get unitNoSink => _unitNoStreamController.sink;

  Sink get priceSink => _priceStreamController.sink;

  Sink get quantitySink => _quantityStreamController.sink;

  Sink get totalSink => _totalStreamController.sink;

  Sink get creationDateSink => _creationDateStreamController.sink;

  Sink get invoiceDetailValidationSink =>
      _invoiceDetailValidationStreamController.sink;

  Stream<bool> get outPutIsOrderNoValid =>
      _orderNoStreamController.stream.map((no) => no != 0);

  Stream<bool> get outPutIsInvoiceNameValid =>
      _invoiceNameStreamController.stream.map((name) => name.isNotEmpty);

  Stream<bool> get outPutIsUnitNoValid =>
      _unitNoStreamController.stream.map((no) => no != 0);

  Stream<bool> get outPutIsPriceValid =>
      _priceStreamController.stream.map((price) => price != 0);

  Stream<bool> get outPutIsQuantityValid =>
      _quantityStreamController.stream.map((quantity) => quantity != 0);

  Stream<bool> get outPutIsTotalValid =>
      _totalStreamController.stream.map((total) => total != 0);

  Stream<bool> get outPutIsCreationDateValid =>
      _creationDateStreamController.stream.map((date) => date.isNotEmpty);

  Stream<bool> get outPutIsInvoiceDetailValid =>
      _invoiceDetailValidationStreamController.stream
          .map((data) => isAllInputsValid());

  setName(String name) {
    invoiceDetailModel.name = name;
    _invoiceNameStreamController.add(name);
    invoiceDetailValidationSink.add(null);
  }

  setOrderNo(String orderNo) {
    invoiceDetailModel.orderNo = orderNo.toInt();
    _orderNoStreamController.add(orderNo.toInt());
    invoiceDetailValidationSink.add(null);
  }

  setUnitNo(String unitNo) {
    invoiceDetailModel.unitNo = unitNo.toInt();
    _unitNoStreamController.add(unitNo.toInt());
    invoiceDetailValidationSink.add(null);
  }

  setPrice(String price) {
    invoiceDetailModel.price = price.toDouble();
    _priceStreamController.add(price.toDouble());
    invoiceDetailValidationSink.add(null);
  }

  setQuantity(String quantity) {
    invoiceDetailModel.quantity = quantity.toDouble();
    _quantityStreamController.add(quantity.toDouble());
    invoiceDetailValidationSink.add(null);
  }

  setTotal(String total) {
    invoiceDetailModel.total = total.toDouble();
    _totalStreamController.add(total.toDouble());
    invoiceDetailValidationSink.add(null);
  }

  setCreationDate(String creationDate) {
    invoiceDetailModel.creationDate = creationDate;
    _creationDateStreamController.add(creationDate);
    invoiceDetailValidationSink.add(null);
  }

  bool isAllInputsValid() {
    return invoiceDetailModel.orderNo != 0 &&
        invoiceDetailModel.unitNo != 0 &&
        invoiceDetailModel.price != 0 &&
        invoiceDetailModel.quantity != 0 &&
        invoiceDetailModel.total != 0 &&
        super.isUnitValid();
  }

  @override
  void dispose() {
    _orderNoStreamController.close();
    _invoiceNameStreamController.close();
    _unitNoStreamController.close();
    _priceStreamController.close();
    _quantityStreamController.close();
    _totalStreamController.close();
    _creationDateStreamController.close();
    _invoiceDetailValidationStreamController.close();
    super.dispose();
  }
}
