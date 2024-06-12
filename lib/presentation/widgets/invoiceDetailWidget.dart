import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/presentation/widgets/UnitWidget.dart';
import 'package:flutter/material.dart';

Widget invoiceDetailWidget(InvoiceDetailModel invoice) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.lightBlue.shade50),
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        Row(
          children: [
            Text("Name: ${invoice.name}"),
            const Spacer(),
            Text("Order No: ${invoice.orderNo}"),
            const Spacer(),
            Text("Unit No: ${invoice.unitNo}"),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Text("Price: ${invoice.price}"),
            const Spacer(),
            Text("Quantity: ${invoice.quantity}"),
            const Spacer(),
            Text("Total: ${invoice.total}"),
          ],
        ),
        const SizedBox(height: 10,),
        unitWidget(invoice.unit),

        Text("Order Date: ${invoice.creationDate}"),

        const SizedBox(height: 10,),


      ],
    ),
  );
}
