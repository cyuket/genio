import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:geniopay/app/shared/asset.dart';
import 'package:geniopay/app/shared/colors.dart';
import 'package:geniopay/app/shared/fonts.dart';
import 'package:geniopay/app/shared/ui_helpers.dart';
import 'package:geniopay/core/navigators/routes.dart';
import 'package:geniopay/features/presentation/pages/homepage.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff105A14),
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
                      TextBold(
                        'Track & Offset',
                        color: Colors.white,
                        fontSize: 29,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),
                  TextRegular(
                    'Monthly analysis',
                    color: Colors.white,
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 171,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.green,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'CO2 ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Emission',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  TextBold(
                                    '815 kg',
                                    color: Colors.white,
                                    fontSize: 29,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: SvgPicture.asset(AppAsset.leaf),
                                  ),
                                  TextRegular(
                                    ' 223',
                                    fontSize: 13,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      gapMedium,
                      Expanded(
                        child: Container(
                          height: 171,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '127 ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'trees planted ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              gapTiny,
                              Container(
                                height: 58,
                                width: 58,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 45,
                                      offset: Offset(0, 10),
                                      color: Color.fromRGBO(74, 85, 104, 0.25),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: 30,
                                    width: 22,
                                    child: SvgPicture.asset(AppAsset.xmas),
                                  ),
                                ),
                              ),
                              gapSmall,
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  color: const Color.fromRGBO(
                                    187,
                                    239,
                                    255,
                                    0.79,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(70),
                                        color: AppColors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              TextRegular(
                                '20 points left to next tree',
                                color: AppColors.green,
                                fontSize: 10,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
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
                        icon: AppAsset.download,
                        text: 'Calculate',
                        color: AppColors.green,
                      ),
                      HomePayoutWidget(
                        icon: AppAsset.upload,
                        text: 'Offset',
                        color: AppColors.green,
                      ),
                      HomePayoutWidget(
                        icon: AppAsset.leaf,
                        text: 'Projects',
                        color: AppColors.green,
                      ),
                      HomePayoutWidget(
                        icon: AppAsset.about,
                        text: 'About',
                        color: AppColors.green,
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      TextBold('Recent history'),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.activityScreen,
                          );
                        },
                        child: TextRegular(
                          'View All',
                          style: const TextStyle(
                            textBaseline: TextBaseline.ideographic,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(20),
                  const TrackWidget(),
                  const TrackWidget(),
                  const TrackWidget(),
                  const TrackWidget(),
                  const TrackWidget(),
                  const TrackWidget(),
                ],
              ),
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}

class TrackWidget extends StatelessWidget {
  const TrackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 20,
              child: Center(
                child: SizedBox(
                  height: 20,
                  width: 15,
                  child: SvgPicture.asset(
                    AppAsset.xmas,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            gapSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRegular(
                    'CO2 Offset - 1 tree planted',
                    fontSize: 13,
                    color: AppColors.primaryTextColor,
                  ),
                  gapTiny,
                  TextRegular(
                    'Amazon Forest - Brazil',
                    fontSize: 10,
                  ),
                  TextRegular(
                    '2021.05.04',
                    fontSize: 10,
                    color: const Color(0xff8E8E8E),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_rounded,
                      color: Color(0xffFFDA44),
                    ),
                    TextRegular(
                      '2000',
                      color: const Color(0xff2B4146),
                      fontSize: 13,
                    )
                  ],
                ),
                TextRegular(
                  '0.23 Tonnes',
                  color: AppColors.green,
                  fontSize: 10,
                )
              ],
            )
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
