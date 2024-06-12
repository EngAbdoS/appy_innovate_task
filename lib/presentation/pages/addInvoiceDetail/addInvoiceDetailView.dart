import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/presentation/pages/addInvoiceDetail/addInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/widgets/inputInvoiceDetail.dart';
import 'package:appy_innovate/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddInvoiceDetailView extends StatelessWidget {
  AddInvoiceDetailView({super.key});

  final AddInvoiceDetailViewModel addInvoiceDetailViewModel =
      instance<AddInvoiceDetailViewModel>();

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
            child: const Text("post Invoice Detail")),
        backgroundColor: Colors.lightBlue.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              InputInvoiceDetail(
                viewModel: addInvoiceDetailViewModel,
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () => (addInvoiceDetailViewModel.isAllInputsValid())
                    ? {
                        addInvoiceDetailViewModel.addInvoiceDetail(),
                        // Navigator.pop(context),
                      }
                    : {toastWidget("Please Enter All Fields with valid data.")},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                child: const Text("Add Invoice Detail"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
