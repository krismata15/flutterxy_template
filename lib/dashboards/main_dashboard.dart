import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterxy/appbar/standard_app_bar.dart';
import 'package:flutterxy/dashboards/widgets/companies_table_de.dart';
import 'package:flutterxy/utils/device_type_based_on_screen.dart';
import 'package:flutterxy/utils/styles_values.dart';
import 'package:flutterxy/utils/text_styles.dart';
import 'package:flutterxy/widgets/basic_elevated_container.dart';
import 'package:flutterxy/widgets/standard_button.dart';
import 'package:flutterxy/widgets/standard_drawer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DeviceScreen.isTablet(context) ? const StandardDrawer() : null,
      body: Row(
        children: [
          if (DeviceScreen.isMonitor(context))
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const StandardDrawer(
                elevation: 0,
              ),
            ),
          Expanded(
            child: Scrollbar(
              child: LayoutBuilder(builder: (context, constrains) {
                final double maxHeight = MediaQuery.of(context).size.height;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StandardAppBar(),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            //First part
                            SizedBox(
                              height: maxHeight * 0.26,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constrains.maxWidth * 0.40,
                                    child: const CongratulationsSalesDE(),
                                  ),
                                  const Expanded(
                                    child: StatisticsDataDE(),
                                  ),
                                ],
                              ),
                            ),
                            //Second
                            SizedBox(
                              height: maxHeight * 0.48,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constrains.maxWidth * 0.40,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Expanded(
                                              child: OrdersTotalDE(),
                                            ),
                                            Expanded(
                                              child: ProfitTotalDE(),
                                            ),
                                          ],
                                        ),
                                        const Expanded(
                                          child: EarningsTotalDE(),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: RevenueReportDataDE(),
                                  ),
                                ],
                              ),
                            ),
                            //Third
                            SizedBox(
                              height: maxHeight * 0.6,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    width: constrains.maxWidth * 0.65,
                                    child: const CompaniesTableDE(),
                                  ),
                                  const Expanded(
                                    child: EventsPanelDE(),
                                  )
                                ],
                              ),
                            ),
                            //Fourth
                            SizedBox(
                              height: maxHeight * 0.52,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constrains.maxWidth * 0.65,
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: BrowserStatesDE(),
                                        ),
                                        Expanded(
                                          child: GoalOverviewDE(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: TransactionsDE(),
                                  ),
                                ],
                              ),
                            ),
                            //
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                          'COPYRIGHT © 2022 @kmata, All rights Reserved'),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionsDE extends StatelessWidget {
  const TransactionsDE({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: TextStyles.h5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: 20,
                ),
              ),
            ],
          ),
          ...[
            TransactionDataForTile('Wallet', 'Starbucks',
                Icons.shopping_basket_sharp, Colors.purple, 'debit', 74),
            TransactionDataForTile('Bank Transfer', 'Add Money', Icons.check,
                Colors.green, 'credit', 480),
            TransactionDataForTile(
                'Paypal',
                'Add Money',
                Icons.monetization_on_outlined,
                Colors.redAccent,
                'credit',
                590),
            TransactionDataForTile('Mastercard', 'Ordered Food',
                Icons.card_membership, Colors.orange, 'debit', 74),
            TransactionDataForTile('Transfer', 'Refund', Icons.bolt_sharp,
                Colors.blue, 'credit', 98),
          ].map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TransactionsTile(data: e),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionsTile extends StatelessWidget {
  const TransactionsTile({super.key, required this.data});

  final TransactionDataForTile data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: data.color.withOpacity(0.15),
              ),
              child: Icon(
                data.icon,
                color: data.color,
                size: 18,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.destination,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  data.description,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          '${data.type == 'debit' ? '-' : '+'} \$${data.amount}',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            color: data.type == 'debit' ? Colors.red : Colors.green,
          ),
        )
      ],
    );
  }
}

class TransactionDataForTile {
  TransactionDataForTile(this.destination, this.description, this.icon,
      this.color, this.type, this.amount);

  final String destination;
  final String description;
  final IconData icon;
  final Color color;
  final String type;
  final double amount;
}

class GoalOverviewDE extends StatelessWidget {
  const GoalOverviewDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, closeConstraints) {
      return BasicElevatedContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Goal Overview',
                  style: TextStyles.h5,
                ),
                Icon(
                  Icons.help_outline_rounded,
                  color: Colors.grey.shade400,
                  size: 18,
                ),
              ],
            ),
            CircularPercentIndicator(
              radius: closeConstraints.minWidth * 0.26,
              lineWidth: 10,
              center: const Text(
                '83%',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              percent: 83 / 100,
              progressColor: Colors.green,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Completed',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '786,617',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                      child: VerticalDivider(),
                    ),
                    Column(
                      children: [
                        Text(
                          'In Progress',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          '13,561',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}

class BrowserStatesDE extends StatelessWidget {
  const BrowserStatesDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Browser States',
                    style: TextStyles.h5,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    'Counter August 2020',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ...[
            BrowserData(
                'Google Chrome',
                'assets/images/dashboard/chrome_icon.png',
                54.4,
                StyleValues.primaryColor),
            BrowserData('Mozila Firefox',
                'assets/images/dashboard/firefox_icon.png', 6.1, Colors.orange),
            BrowserData(
                'Apple Safari',
                'assets/images/dashboard/safari_icon.png',
                14.6,
                Colors.blueAccent),
            BrowserData(
                'Internet Explorer',
                'assets/images/dashboard/ie_icon.png',
                4.2,
                Colors.lightBlueAccent),
            BrowserData('Opera Mini', 'assets/images/dashboard/opera_icon.png',
                8.4, Colors.redAccent),
          ].map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: BrowserUseStaticTile(
                name: e.name,
                assetIcon: e.assetIcon,
                percentage: e.percentage,
                percentColor: e.percentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BrowserData {
  BrowserData(this.name, this.assetIcon, this.percentage, this.percentColor);

  final String name;
  final String assetIcon;
  final double percentage;
  final Color percentColor;
}

class BrowserUseStaticTile extends StatelessWidget {
  const BrowserUseStaticTile(
      {super.key,
      required this.assetIcon,
      required this.name,
      required this.percentage,
      required this.percentColor});

  final String assetIcon;
  final String name;
  final double percentage;
  final Color percentColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(assetIcon),
            const SizedBox(
              width: 12,
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '$percentage%',
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            CircularPercentIndicator(
              radius: 14,
              lineWidth: 4,
              percent: percentage / 100,
              progressColor: percentColor,
            ),
          ],
        ),
      ],
    );
  }
}

class EventsPanelDE extends StatelessWidget {
  const EventsPanelDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(4),
            ),
            child: Image.asset('assets/images/dashboard/desk_woman.png'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'THU',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '24',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: VerticalDivider(),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Developer Meetup',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text('Meet world popular developers')
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: StyleValues.primaryColor
                                      .withOpacity(0.15),
                                ),
                                child: const Icon(
                                  Icons.calendar_month,
                                  color: StyleValues.primaryColor,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Sat, May 25, 2020',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    '10:AM to 6:PM',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: StyleValues.primaryColor
                                      .withOpacity(0.15),
                                ),
                                child: const Icon(
                                  Icons.location_pin,
                                  color: StyleValues.primaryColor,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Central Park',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Manhattan, New york City',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ...List.generate(
                                5,
                                (index) {
                                  const double thresholdPosition = 28;
                                  return Positioned(
                                    left: thresholdPosition * index,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            'assets/images/dashboard/person_avatar_${index + 1}.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text('+42'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RevenueReportDataDE extends StatelessWidget {
  const RevenueReportDataDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Revenue Report',
                      style: TextStyles.h5,
                    ),
                    Row(
                      children: const [
                        LegendDotText(
                          color: StyleValues.primaryColor,
                          text: 'Earning',
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        LegendDotText(
                          color: StyleValues.orangeColor,
                          text: 'Expense',
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                          'assets/images/dashboard/multiple_bars.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: VerticalDivider(),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: const [
                    Text(
                      r'$25,852',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('Budget: 56,800'),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset('assets/images/dashboard/purple_line.png'),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: StandardButton(
                    label: 'Increase Budget',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LegendDotText extends StatelessWidget {
  const LegendDotText({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(text),
      ],
    );
  }
}

class EarningsTotalDE extends StatelessWidget {
  const EarningsTotalDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Earnings',
                  style: TextStyles.h5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('This Month'),
                    Text(r'$4055.56'),
                  ],
                ),
                const Text('68.2% more earnings than last month.'),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/dashboard/green_circle.png',
            ),
          )
        ],
      ),
    );
  }
}

class ProfitTotalDE extends StatelessWidget {
  const ProfitTotalDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profit',
            style: TextStyles.h5,
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            '6,24k',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            'assets/images/dashboard/blue_line.png',
          ),
        ],
      ),
    );
  }
}

class OrdersTotalDE extends StatelessWidget {
  const OrdersTotalDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Orders',
            style: TextStyles.h5,
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            '2,76k',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Image.asset(
            'assets/images/dashboard/yellow_bars.png',
          ),
        ],
      ),
    );
  }
}

class StatisticsDataDE extends StatelessWidget {
  const StatisticsDataDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Statistics',
                style: TextStyles.h5,
              ),
              Text(
                'updated 1 month ago',
                style: TextStyles.pSmallCard,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _StatisticsTileDE(
                      color: Colors.teal,
                      icon: Icons.alt_route_rounded,
                      amount: '230k',
                      label: 'Sales',
                    ),
                    _StatisticsTileDE(
                      color: Colors.redAccent,
                      icon: Icons.person_add_alt,
                      amount: '8.549k',
                      label: 'Customers',
                    ),
                    _StatisticsTileDE(
                      color: Colors.greenAccent,
                      icon: Icons.indeterminate_check_box_outlined,
                      amount: '1.423k',
                      label: 'Products',
                    ),
                    _StatisticsTileDE(
                      color: Colors.blueAccent,
                      icon: Icons.monetization_on_outlined,
                      amount: r'$9745',
                      label: 'Revenue',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StatisticsTileDE extends StatelessWidget {
  const _StatisticsTileDE(
      {super.key,
      required this.color,
      required this.icon,
      required this.amount,
      required this.label});

  final Color color;
  final IconData icon;
  final String amount;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.2),
            ),
            child: Icon(
              icon,
              color: color,
              size: 26,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText(
                amount,
                style: TextStyles.h4,
              ),
              SelectableText(
                label,
                style: TextStyles.pSmallCard,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CongratulationsSalesDE extends StatelessWidget {
  const CongratulationsSalesDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Congratulations 🎉 John!',
                  style: TextStyles.h5,
                ),
                SelectableText(
                  'You have won gold medal',
                  style: TextStyles.pSmallCard,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SelectableText(
                          r'$48.9k',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const StandardButton(
                          label: 'View Sales',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 30,
            top: 0,
            child: SvgPicture.asset(
              'assets/images/dashboard/medal_icon.svg',
            ),
          ),
        ],
      ),
    );
  }
}
