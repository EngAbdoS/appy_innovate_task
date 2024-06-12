import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/presentation/mainPage.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/addInvoiceDetail/addInvoiceDetailView.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/deleteInvoiceDetail/deleteInvoiceDetailView.dart';
import 'package:appy_innovate/presentation/pages/invoiceDetail/putInvoiceDetail/putInvoiceDetailView.dart';
import 'package:appy_innovate/presentation/pages/put/addUnit/addUnitView.dart';
import 'package:appy_innovate/presentation/pages/put/deleteUnit/deleteUnitView.dart';
import 'package:appy_innovate/presentation/pages/put/getUnits/getUnitsView.dart';
import 'package:appy_innovate/presentation/pages/put/putUnit/putUnitView.dart';
import 'package:appy_innovate/presentation/side_menu/side_menu_viewModel/side_menu_viewModel.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class SideMenuView extends StatelessWidget {
  SideMenuView({super.key});

  final SideMenuViewModel _viewModel = instance<SideMenuViewModel>();
  final SideMenuController sideMenuController = SideMenuController();
  final pages = [
    MainPage(),
    AddUnitView(),
    PutUnitView(),
    DeleteUnitView(),
    const GetUnitsView(),
    AddInvoiceDetailView(),
    PutInvoiceDetailView(),
    DeleteInvoiceDetailView(),
  ];
  final List items = [
    SideMenuItem(
      title: 'Main Page',
      onTap: (index, sideMenu) => sideMenu.changePage(index),
      icon: const Icon(Icons.home),
    ),
    SideMenuExpansionItem(
      title: "Units",
      icon: const Icon(Icons.assignment),
      children: [
        SideMenuItem(
          title: 'post Unit',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.add),
        ),
        SideMenuItem(
          title: 'Put Unit',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.edit_attributes),
        ),
        SideMenuItem(
          title: 'Delete Unit',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.delete_forever_outlined),
        ),
        SideMenuItem(
          title: 'Get Units',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.get_app),
        ),
      ],
    ),
    SideMenuExpansionItem(
      title: "Invoice Detail",
      icon: const Icon(Icons.inventory_outlined),
      children: [
        SideMenuItem(
          title: 'post Invoice',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.add),
        ),
        SideMenuItem(
          title: 'Put Invoice',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.edit_attributes),
        ),
        SideMenuItem(
          title: 'Delete Invoice',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.delete_forever_outlined),
        ),
        SideMenuItem(
          title: 'Get Invoice details',
          onTap: (index, sideMenu) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.get_app),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    sideMenuController
        .addListener((index) => _viewModel.changePageWidget(index));

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SideMenu(
              style: SideMenuStyle(
                displayMode: SideMenuDisplayMode.auto,
                decoration: const BoxDecoration(),
                openSideMenuWidth: 200,
                compactSideMenuWidth: 60,
                hoverColor: Colors.blue[100],
                selectedColor: Colors.lightBlue,
                selectedIconColor: Colors.white,
                unselectedIconColor: Colors.black54,
                backgroundColor: Colors.lightBlue.withOpacity(.05),
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                unselectedTitleTextStyle:
                    const TextStyle(color: Colors.black54),
                iconSize: 20,
                itemBorderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                showTooltip: true,
                showHamburger: true,
                itemHeight: 50.0,
                itemInnerSpacing: 8.0,
                itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                toggleColor: Colors.black54,

                // Additional properties for expandable items
                selectedTitleTextStyleExpandable:
                    const TextStyle(color: Colors.white),
                // Adjust the style as needed
                unselectedTitleTextStyleExpandable:
                    const TextStyle(color: Colors.black54),
                // Adjust the style as needed
                selectedIconColorExpandable: Colors.white,
                // Adjust the color as needed
                unselectedIconColorExpandable: Colors.black54,
                // Adjust the color as needed
                arrowCollapse: Colors.blueGrey,
                // Adjust the color as needed
                arrowOpen: Colors.lightBlueAccent,
                // Adjust the color as needed
                iconSizeExpandable: 24.0, // Adjust the size as needed
              ),
              controller: sideMenuController,
              showToggle: true,
              title: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://play-lh.googleusercontent.com/XzvlnNFxAAkvBZ2MIsXtkGc8zu-J2H0IdfI-maExrRB-s_Z9GcMgDKTa7D63VGaKiA',
                  fit: BoxFit.cover,
                  // height: 300.h,
                ),
              )),
              // footer: const Text('Appy Innovate'),
              onDisplayModeChanged: (mode) {
                print(mode);
              },
              items: items,
            ),
          ),
          Expanded(
            //Stream builder

            child: StreamBuilder<int>(
                stream: _viewModel.currentPageWidgetStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return pages[snapshot.data!];
                  } else {
                    return pages[0];
                  }
                }),
          ),
        ],
      ),
    );
  }
}
