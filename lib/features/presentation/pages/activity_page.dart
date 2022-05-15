import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geniopay/app/shared/asset.dart';
import 'package:geniopay/app/shared/colors.dart';
import 'package:geniopay/app/shared/fonts.dart';
import 'package:geniopay/features/presentation/pages/homepage.dart';
import 'package:intl/intl.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final dateFilterList = ['Day', 'Week', 'Month', 'Year'];
  final monthsList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final list = <FlSpot>[
    FlSpot(0, 3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
  ];

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
            Icons.arrow_back_ios,
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
                const Gap(40),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: LineChart(
                      sampleData1(list),
                      swapAnimationDuration: const Duration(
                        milliseconds: 250,
                      ),
                    ),
                  ),
                ),
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

  LineChartData sampleData1(List<FlSpot> list) {
    final date = DateTime.now();
    final daysOfTheWeek = <String>[];
    for (var i = 0; i < 7; i++) {
      final newDate = date.subtract(Duration(days: i));
      final newFormatted =
          DateFormat().add_E().format(DateTime.parse(newDate.toString()));
      daysOfTheWeek.add(newFormatted);
    }
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            // tooltipBgColor: SqinColors.,
            ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          getTextStyles: (_, value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return daysOfTheWeek[6];
              case 4:
                return daysOfTheWeek[5];
              case 6:
                return daysOfTheWeek[4];
              case 8:
                return daysOfTheWeek[3];
              case 10:
                return daysOfTheWeek[2];
              case 12:
                return daysOfTheWeek[1];
              case 14:
                return daysOfTheWeek[0];
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (_, value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
          // getTitles: (value) {
          //   switch (value.toInt()) {
          //     case 4:
          //       return '100';
          //     case 3:
          //       return '75';
          //     case 2:
          //       return '50';
          //     case 1:
          //       return '25';
          //     case 0:
          //       return '0';
          //   }
          //   return '';
          // },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(list),
    );
  }

  List<LineChartBarData> linesBarData1(List<FlSpot> list) {
    final lineChartBarData1 = LineChartBarData(
      spots: list,
      isCurved: true,
      colors: [
        const Color(0xff008AA7).withOpacity(.26),
        const Color(0xff008AA7),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    return [
      lineChartBarData1,
    ];
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
