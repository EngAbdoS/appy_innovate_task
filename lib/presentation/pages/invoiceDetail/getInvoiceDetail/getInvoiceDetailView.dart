import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/getInvoiceDetail/getInvoiceDetailViewModel.dart';
import 'package:appy_innovate/presentation/widgets/invoiceDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetInvoiceDetailView extends StatefulWidget {
  const GetInvoiceDetailView({super.key});

  @override
  State<GetInvoiceDetailView> createState() => _GetInvoiceDetailViewState();
}

class _GetInvoiceDetailViewState extends State<GetInvoiceDetailView> {
  final GetInvoiceDetailViewModel getInvoiceDetailViewModel = instance<GetInvoiceDetailViewModel>();

  @override
  void initState() {
    getInvoiceDetailViewModel.getInvoiceDetail(context);
    super.initState();
  }

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
            child: const Text("Get Invoice Detail")),
        backgroundColor: Colors.lightBlue.withOpacity(0.4),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: StreamBuilder<List<InvoiceDetailModel>>(
                  builder: (context, snapshot) {
                    return (snapshot.hasData && (snapshot.data!.isNotEmpty))
                        ? ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: invoiceDetailWidget(snapshot.data![index]),
                          ),
                    )
                        : Container();
                  },
                  stream: getInvoiceDetailViewModel.outputInvoiceDetailList,
                )),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
              onPressed: () => getInvoiceDetailViewModel.getInvoiceDetail(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              child: const Text("Delete Invoice Detail"),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
