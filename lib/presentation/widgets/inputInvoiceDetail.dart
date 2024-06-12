import 'package:appy_innovate/presentation/pages/addInvoiceDetail/addInvoiceDetailView.dart';
import 'package:appy_innovate/presentation/pages/addInvoiceDetail/addInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/widgets/inputUnit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputInvoiceDetail extends StatelessWidget {
  InputInvoiceDetail({super.key, required this.viewModel});

  final AddInvoiceDetailViewModel viewModel;
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController quantityTextEditingController =
      TextEditingController();
  final TextEditingController priceTextEditingController =
      TextEditingController();
  final TextEditingController totalTextEditingController =
      TextEditingController();
  final TextEditingController creationDateTextEditingController =
      TextEditingController();
  final TextEditingController unitNoTextEditingController =
      TextEditingController();
  final TextEditingController orderNoTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Column(
        children: [
          StreamBuilder<bool>(
              stream: viewModel.outPutIsInvoiceNameValid,
              builder: (context, snapshot) {
                return TextFormField(
                  onChanged: (name) => viewModel.setName(name),
                  keyboardType: TextInputType.name,
                  controller: nameTextEditingController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // label: Text(AppStrings.username.tr()),
                    hintText: "enter name",
                    labelText: "name",
                    errorText: (snapshot.data ?? true) ? null : "invalid name",
                  ),
                );
              }),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 1,
                child: StreamBuilder<bool>(
                    stream: viewModel.outPutIsOrderNoValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        onChanged: (orderNo) => viewModel.setOrderNo(orderNo),
                        keyboardType: TextInputType.number,
                        controller: orderNoTextEditingController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "enter orderNo",
                          labelText: "orderNo",
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "invalid orderNo",
                        ),
                      );
                    }),
              ),
              SizedBox(
                width: 20.h,
              ),
              Flexible(
                flex: 1,
                child: StreamBuilder<bool>(
                    stream: viewModel.outPutIsUnitNoValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        onChanged: (unitNo) => viewModel.setUnitNo(unitNo),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: unitNoTextEditingController,
                        decoration: InputDecoration(
                          hintText: "enter unitNo",
                          labelText: "unitNo",
                          errorText:
                              (snapshot.data ?? true) ? null : "invalid unitNo",
                        ),
                      );
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 1,
                child: StreamBuilder<bool>(
                    stream: viewModel.outPutIsPriceValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        onChanged: (price) => viewModel.setPrice(price),
                        keyboardType: TextInputType.number,
                        controller: priceTextEditingController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "enter price",
                          labelText: "price",
                          errorText:
                              (snapshot.data ?? true) ? null : "invalid price",
                        ),
                      );
                    }),
              ),
              SizedBox(
                width: 20.h,
              ),
              Flexible(
                flex: 1,
                child: StreamBuilder<bool>(
                    stream: viewModel.outPutIsQuantityValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        onChanged: (quantity) =>
                            viewModel.setQuantity(quantity),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: quantityTextEditingController,
                        decoration: InputDecoration(
                          hintText: "enter quantity",
                          labelText: "quantity",
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "invalid quantity",
                        ),
                      );
                    }),
              ),
              SizedBox(
                width: 20.h,
              ),
              Flexible(
                flex: 1,
                child: StreamBuilder<bool>(
                    stream: viewModel.outPutIsTotalValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        onChanged: (total) => viewModel.setTotal(total),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: totalTextEditingController,
                        decoration: InputDecoration(
                          hintText: "enter total",
                          labelText: "total",
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "invalid quantity",
                        ),
                      );
                    }),
              ),
            ],
          ),
          InputUnit(
            outputIsUnitNameValid: viewModel.outputIsUnitNameValid,
            outputIsUnitIdValid: viewModel.outputIsUnitIdValid,
            setUnitId: viewModel.setUnitId,
            setUnitName: viewModel.setUnitName,
          ),
        ],
      ),
    );
  }
}
