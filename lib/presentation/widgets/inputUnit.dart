import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputUnit extends StatelessWidget {
  InputUnit(
      {super.key,
      required this.outputIsUnitNameValid,
      required this.outputIsUnitIdValid,
      required this.setUnitName,
      required this.setUnitId});
  final Stream<bool> outputIsUnitNameValid;
  final Stream<bool> outputIsUnitIdValid;
  final Function setUnitName;
  final Function setUnitId;
  final TextEditingController unitNameTextEditingController =
      TextEditingController();
  final TextEditingController unitIdTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            child: StreamBuilder<bool>(
                stream: outputIsUnitNameValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (name) => setUnitName(name),
                    keyboardType: TextInputType.number,
                    controller: unitNameTextEditingController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "enter Unit name",
                      labelText: "Unit name",
                      errorText:
                          (snapshot.data ?? true) ? null : "invalid Unit name",
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
                stream: outputIsUnitIdValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (id) => setUnitId(id),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: unitIdTextEditingController,
                    decoration: InputDecoration(
                      hintText: "enter Unit Id",
                      labelText: "Unit Id",
                      errorText:
                          (snapshot.data ?? true) ? null : "invalid Unit id",
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
