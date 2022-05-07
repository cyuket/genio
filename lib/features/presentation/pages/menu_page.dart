import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:geniopay/app/shared/asset.dart';
import 'package:geniopay/app/shared/colors.dart';
import 'package:geniopay/app/shared/fonts.dart';
import 'package:geniopay/app/shared/ui_helpers.dart';
import 'package:geniopay/app/widget/busy_button.dart';
import 'package:geniopay/app/widget/touchables/touchable_opacity.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final list = [
    const Color(0xffE9DA6C),
    const Color(0xffF87549),
    const Color(0xff008AA7),
    const Color(0xffFDAE09),
  ];
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          SvgPicture.asset(AppAsset.help),
          const Gap(20),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 300,
                width: 227,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: list[selectedColor],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(AppAsset.chip),
                      ],
                    ),
                    SizedBox(
                      height: 65,
                      width: 66,
                      child: Image.asset(AppAsset.geniopay),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(AppAsset.master),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                child: Column(
                  children: [
                    TextBold(
                      'Lime Plastic',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                    ),
                    gapSmall,
                    TextRegular(
                      'Our standard contactless card, made\nfrom plastic in 4 different colors',
                      textAlign: TextAlign.center,
                      color: const Color(0xff2B4146),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ColorPallete(
                          color: list[0],
                          onTap: () => setState(() => selectedColor = 0),
                          isActive: selectedColor == 0,
                        ),
                        ColorPallete(
                          color: list[1],
                          onTap: () => setState(() => selectedColor = 1),
                          isActive: selectedColor == 1,
                        ),
                        ColorPallete(
                          color: list[2],
                          onTap: () => setState(() => selectedColor = 2),
                          isActive: selectedColor == 2,
                        ),
                        ColorPallete(
                          color: list[3],
                          onTap: () => setState(() => selectedColor = 3),
                          isActive: selectedColor == 3,
                        ),
                      ],
                    ),
                    const Gap(20),
                    BusyButton(title: 'GET FREE CARD', onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPallete extends StatelessWidget {
  const ColorPallete({
    Key? key,
    required this.color,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);
  final Color color;
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isActive ? Border.all(width: 2) : null,
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: color,
        ),
      ),
    );
  }
}
