import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/app/shared/asset.dart';
import 'package:geniopay/app/widget/touchables/touchable_opacity.dart';
import 'package:geniopay/features/presentation/pages/homepage.dart';
import 'package:geniopay/features/presentation/pages/menu_page.dart';
import 'package:geniopay/features/presentation/pages/wallet_page.dart';
import 'package:geniopay/features/presentation/widget/navbar_widget.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key, this.params}) : super(key: key);
  final HomeContainerParams? params;
  @override
  HomeContainerState createState() => HomeContainerState();
}

class HomeContainerState extends State<HomeContainer> {
  late int _selectedIndex;
  Widget? child;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      if (widget.params == null) {
        _selectedIndex = 0;
        child = null;
      } else {
        _selectedIndex = widget.params!.index;
        child = widget.params!.child;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _widgetOptions = <Widget>[
      const HomePage(),
      Container(),
      const WalletPage(),
      const MenuPage(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(
          _selectedIndex,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: TouchableOpacity(
        // onTap: () => CreateEscrowBottomSheet.show(context: context),
        child: Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAsset.home,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.white,
        selectedColor: Colors.black,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        centerItemText: '',
        items: [
          FABBottomAppBarItem(
            icon: AppAsset.card,
            text: 'Home',
          ),
          FABBottomAppBarItem(
            icon: AppAsset.dollar,
            text: 'File',
          ),
          FABBottomAppBarItem(
            icon: AppAsset.wallet,
            text: 'File',
          ),
          FABBottomAppBarItem(
            icon: AppAsset.menu,
            text: 'File',
          ),
        ],
      ),
    );
  }
}

class HomeContainerParams {
  HomeContainerParams({this.child, required this.index});

  final int index;
  final Widget? child;
}
