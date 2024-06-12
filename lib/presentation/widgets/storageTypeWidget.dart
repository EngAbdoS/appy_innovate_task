import 'package:appy_innovate/app/constants.dart';
import 'package:appy_innovate/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';

class StorageTypeWidget extends StatefulWidget {
  const StorageTypeWidget({super.key});

  @override
  State<StorageTypeWidget> createState() => _StorageTypeWidgetState();
}

class _StorageTypeWidgetState extends State<StorageTypeWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        button(0, "Remote"),
        button(1, "FireBase"),
        button(2, "Local"),
      ],
    );
  }

  Widget button(int index, String text) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () => index == 2
            ? toastWidget('Soon!')
            : {
                index == 0
                    ? defaultStorage = StorageType.remoteApi
                    : defaultStorage = StorageType.firebase,
                setState(() {
                  selectedIndex = index;
                })
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedIndex == index
              ? Colors.lightBlue
              : Colors.lightBlue.withOpacity(0.2),
          foregroundColor: selectedIndex == index
              ? Colors.lightBlue
              : Colors.lightBlue.withOpacity(0.2),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
