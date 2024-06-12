import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/presentation/pages/put/deleteUnit/deleteUnitViewModel.dart';
import 'package:appy_innovate/presentation/widgets/inputUnit.dart';
import 'package:appy_innovate/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteUnitView extends StatelessWidget {
  DeleteUnitView({super.key});

  final DeleteUnitViewModel deleteUnitViewModel = instance<DeleteUnitViewModel>();

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
            child: const Text("Delete Unit")),
        backgroundColor: Colors.lightBlue.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: inputUnitId(deleteUnitViewModel.outputIsUnitIdValid,
                    deleteUnitViewModel.setUnitId),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () => (deleteUnitViewModel.isUnitIdValid())
                    ? {
                  deleteUnitViewModel.deleteUnit(context),
                        // Navigator.pop(context),
                      }
                    : {toastWidget("Please Enter All Fields with valid data.")},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                child: const Text("Delete Unit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
