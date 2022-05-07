import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniopay/app/widget/touchables/touchable_opacity.dart';
import 'package:geniopay/features/presentation/widget/nav_painter.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({
    required this.icon,
    required this.text,
  });

  String icon;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    Key? key,
    required this.items,
    required this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
    required this.currentIndex,
  }) : super(key: key) {
    // assert(this.items.length == 2 || this.items.length == 4);
  }

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  void _updateIndex(int index) {
    widget.onTabSelected(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final items = List<Widget>.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    // items.insert(items.length >> 1, _buildMiddleTabItem());

    return SizedBox(
      height: 110,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(
              size.width,
              (size.width * 0.24).toDouble(),
            ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.white.withOpacity(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    final color = widget.currentIndex == index ? Colors.black : Colors.black;
    return SizedBox(
      height: widget.height,
      child: TouchableOpacity(
        onTap: () => onPressed(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  item.icon,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
