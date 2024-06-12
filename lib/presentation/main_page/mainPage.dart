import 'package:appy_innovate/presentation/widgets/storageTypeWidget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            collapsedHeight: 100,
            //stretch:true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Appy Innovate',
                textScaleFactor: 1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVuQmnrhh6_g1OEyF6c6Tb4qSDrR2dtvtrXg&s',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 800,
                  width: double.maxFinite,
                  color: Colors.lightBlue.withOpacity(0.1),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: StorageTypeWidget(),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
