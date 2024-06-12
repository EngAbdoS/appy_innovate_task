import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/addInvoiceDetail/addInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/putInvoiceDetail/putInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/widgets/inputInvoiceDetail.dart';
import 'package:appy_innovate/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PutInvoiceDetailView extends StatelessWidget {
  PutInvoiceDetailView({super.key});

  final PutInvoiceDetailViewModel putInvoiceDetailViewModel =
      instance<PutInvoiceDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue.shade50),
            child: const Text("Put Invoice Detail")),
        backgroundColor: Colors.lightBlue.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              InputInvoiceDetail(
                viewModel: putInvoiceDetailViewModel,
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () => (putInvoiceDetailViewModel.isAllInputsValid())
                    ? {
                  putInvoiceDetailViewModel.putInvoiceDetail(context),
                        // Navigator.pop(context),
                      }
                    : {toastWidget("Please Enter All Fields with valid data.")},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                child: const Text("Put Invoice Detail"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
