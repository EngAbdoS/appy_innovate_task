import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/presentation/pages/unit/putUnit/putUnitViewModel.dart';
import 'package:appy_innovate/presentation/widgets/inputUnit.dart';
import 'package:appy_innovate/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PutUnitView extends StatelessWidget {
  PutUnitView({super.key});

  final PutUnitViewModel putUnitViewModel = instance<PutUnitViewModel>();

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
            child: const Text("Put Unit")),
        backgroundColor: Colors.lightBlue.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              InputUnit(
                  outputIsUnitNameValid: putUnitViewModel.outputIsUnitNameValid,
                  outputIsUnitIdValid: putUnitViewModel.outputIsUnitIdValid,
                  setUnitName: putUnitViewModel.setUnitName,
                  setUnitId: putUnitViewModel.setUnitId),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () => (putUnitViewModel.isUnitValid())
                    ? {
                        putUnitViewModel.putUnit(context),
                        // Navigator.pop(context),
                      }
                    : {toastWidget("Please Enter All Fields with valid data.")},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                child: const Text("Put Unit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
