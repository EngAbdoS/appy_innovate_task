import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/presentation/pages/put/getUnits/GetUnitsViewModel.dart';
import 'package:appy_innovate/presentation/widgets/UnitWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetUnitsView extends StatefulWidget {
  const GetUnitsView({super.key});

  @override
  State<GetUnitsView> createState() => _GetUnitsViewState();
}

class _GetUnitsViewState extends State<GetUnitsView> {
  final GetUnitsViewModel getUnitsViewModel = instance<GetUnitsViewModel>();

  @override
  void initState() {
    getUnitsViewModel.getUnits(context);
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
            child: const Text("Get Units")),
        backgroundColor: Colors.lightBlue.withOpacity(0.4),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: StreamBuilder<List<UnitModel>>(
              builder: (context, snapshot) {
                return (snapshot.hasData && (snapshot.data!.isNotEmpty))
                    ? ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: unitWidget(snapshot.data![index]),
                            ),
                      )
                    : Container();
              },
              stream: getUnitsViewModel.outputUnitsList,
            )),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
              onPressed: () => getUnitsViewModel.getUnits(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              child: const Text("Get Unit"),
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
