import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geniopay/app/shared/asset.dart';
import 'package:geniopay/app/shared/colors.dart';
import 'package:geniopay/app/shared/fonts.dart';
import 'package:geniopay/features/presentation/pages/homepage.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final dateFilterList = ['Day', 'Week', 'Month', 'Year'];
  final monthsList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  final ValueNotifier<int> _selectedDateFilter = ValueNotifier<int>(0);
  final ValueNotifier<int> _selectedMonth = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: TextBold(
          'Activity',
          style: const TextStyle(
            color: AppColors.titleColor,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
          Gap(20),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Gap(22),
          Center(
            child: Column(
              children: [
                TextRegular(
                  'Total spending',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(11),
                TextBold(
                  r'$3,578.00',
                  style: const TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(29),
                ValueListenableBuilder<int>(
                  valueListenable: _selectedDateFilter,
                  builder: (_, selected, __) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          dateFilterList.length,
                          (index) {
                            final text = dateFilterList[index];
                            return InkWell(
                              onTap: () {
                                _selectedDateFilter.value = index;
                              },
                              child: DateFilter(
                                isSelected: index == selected,
                                text: text,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const Gap(100),
                ValueListenableBuilder<int>(
                  valueListenable: _selectedMonth,
                  builder: (_, selected, __) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: SizedBox(
                        height: 37,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            monthsList.length,
                            (index) {
                              final text = monthsList[index];
                              return InkWell(
                                onTap: () {
                                  _selectedMonth.value = index;
                                },
                                child: DateFilter(
                                  isSelected: index == selected,
                                  text: text,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Gap(29),
          Expanded(
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    const Gap(30),
                    Container(),
                    Row(
                      children: [
                        TextBold(
                          'Transactions',
                        ),
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
                      haveDivider: false,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateFilter extends StatelessWidget {
  const DateFilter({
    Key? key,
    required this.isSelected,
    required this.text,
  }) : super(key: key);

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Center(
          child: TextRegular(
            text,
            style: TextStyle(
              color: isSelected ? const Color(0xff008AA7) : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
