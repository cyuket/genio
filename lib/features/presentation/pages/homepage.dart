// ignore_for_file: use_raw_strings

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:geniopay/app/shared/asset.dart';
import 'package:geniopay/app/shared/colors.dart';
import 'package:geniopay/app/shared/fonts.dart';
import 'package:geniopay/app/shared/ui_helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                      ),
                      const Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextRegular(
                            'Good Morning',
                            fontSize: 12,
                          ),
                          TextBold(
                            'John Smith',
                            fontSize: 18,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppAsset.tree),
                              gapSmall,
                              SvgPicture.asset(AppAsset.notification),
                              gapSmall,
                              SvgPicture.asset(AppAsset.help),
                            ],
                          ),
                          gapSmall,
                          Row(
                            children: [
                              TextRegular(
                                '10 000',
                                fontSize: 12,
                              ),
                              gapSmall,
                              SvgPicture.asset(AppAsset.gift),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(16),
                  TextRegular(
                    'Total Balance',
                    fontSize: 12,
                  ),
                  Row(
                    children: [
                      TextBold('\$10,250.00'),
                      gapSmall,
                      SvgPicture.asset(AppAsset.eyes),
                      const Spacer(),
                      SvgPicture.asset(AppAsset.flag),
                      gapSmall,
                      SvgPicture.asset(AppAsset.arrow),
                    ],
                  ),
                  TextRegular(
                    'USD',
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: const Color(0xffE0F7FE)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      HomePayoutWidget(
                        icon: AppAsset.send,
                        text: 'Pay Out',
                      ),
                      HomePayoutWidget(
                        icon: AppAsset.recieve,
                        text: 'Pay In',
                      ),
                      HomePayoutWidget(
                        icon: AppAsset.swap,
                        text: 'Exchange',
                      ),
                      HomePayoutWidget(
                        icon: AppAsset.more,
                        text: 'More',
                      ),
                    ],
                  ),
                  const Gap(40),
                  SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CardWidget(
                          background: Color(0xffFFF0B1),
                          text: 'Up to 15% cashback on\nclothing and apparels',
                          image: AppAsset.clothings,
                        ),
                        CardWidget(
                          background: Color(0xffE0F7FE),
                          text: 'Refer and earn \$20. ',
                          image: AppAsset.refer,
                        ),
                        CardWidget(
                          background: Color(0xffDCD1FD),
                          text: '',
                          image: AppAsset.clothings,
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      TextBold('Recent transactions'),
                      const Spacer(),
                      TextRegular(
                        'View All',
                        style: const TextStyle(
                          textBaseline: TextBaseline.ideographic,
                        ),
                      )
                    ],
                  ),
                  const Gap(20),
                  const TransactionWidget(
                    title: 'Dribbble Pro',
                    icon: AppAsset.ball,
                  ),
                  const TransactionWidget(
                    title: 'Spotify',
                    icon: AppAsset.spotify,
                    isCompleted: false,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TransactionWidget extends StatelessWidget {
  const TransactionWidget(
      {Key? key,
      required this.icon,
      this.isCompleted = true,
      required this.title})
      : super(key: key);

  final String icon;
  final String title;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.backgroundColor,
              radius: 20,
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
            gapSmall,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextRegular(
                  title,
                  fontSize: 13,
                ),
                TextRegular(
                  '2021.05.04',
                  fontSize: 10,
                  color: const Color(0xff8E8E8E),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextRegular(
                  '-\$ 99.00',
                  fontSize: 13,
                  color: const Color(0xff2B4146),
                ),
                TextRegular(
                  isCompleted ? 'Completed' : 'In Progress',
                  fontSize: 10,
                  color:
                      isCompleted ? AppColors.green : const Color(0xffFB923C),
                ),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            thickness: 2,
            color: AppColors.backgroundColor,
          ),
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key,
      required this.background,
      required this.image,
      required this.text})
      : super(key: key);
  final Color background;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 150,
        height: 119,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(image),
            ),
            TextBold(
              text,
              fontSize: 12,
            )
          ],
        ),
      ),
    );
  }
}

class HomePayoutWidget extends StatelessWidget {
  const HomePayoutWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.backgroundColor,
          child: Center(
            child: SvgPicture.asset(icon),
          ),
        ),
        gapTiny,
        TextBold(
          text,
          fontSize: 12,
        ),
      ],
    );
  }
}
