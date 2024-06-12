import 'package:appy_innovate/domain/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget unitWidget(UnitModel unit) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.lightBlue.shade50),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("Unit Id: ${unit.id}"),
          const Spacer(),
          Text("Unit Name: ${unit.name}"),
        ],
      ),
    ),
  );
}
