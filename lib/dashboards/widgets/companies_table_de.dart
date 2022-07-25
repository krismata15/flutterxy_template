import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterxy/utils/styles_values.dart';
import 'package:flutterxy/widgets/basic_elevated_container.dart';

class CompaniesTableDE extends StatelessWidget {
  const CompaniesTableDE({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _CompaniesTableHeader(),
          ...companiesData.mapIndexed(
            (index, e) => Column(
              children: [
                if (index != 0) const Divider(),
                _CompaniesTableRow(
                  data: e,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CompaniesTableHeader extends StatelessWidget {
  const _CompaniesTableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(4),
        ),
        color: StyleValues.primaryColor.withOpacity(0.1),
      ),
      child: Row(
        children: const [
          HeaderTableTrendingProducts(
            flex: 2,
            text: 'COMPANY',
          ),
          HeaderTableTrendingProducts(
            flex: 2,
            text: 'CATEGORY',
          ),
          HeaderTableTrendingProducts(
            text: 'VIEWS',
          ),
          HeaderTableTrendingProducts(
            text: 'REVENUE',
          ),
          HeaderTableTrendingProducts(
            text: 'SALES',
          ),
        ],
      ),
    );
  }
}

class _CompaniesTableRow extends StatelessWidget {
  const _CompaniesTableRow({
    super.key,
    required this.data,
  });

  final CompaniesDataTile data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          ProductTableElement(
            flex: 2,
            child: _CompanyTile(
              data: data,
            ),
          ),
          ProductTableElement(
            flex: 2,
            child: _CategoryTile(
              data: data,
            ),
          ),
          ProductTableElement(
            child: _ViewsTile(
              data: data,
            ),
          ),
          ProductTableElement(
            child: Text(data.amount),
          ),
          ProductTableElement(
            child: _SalesTile(
              data: data,
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesTile extends StatelessWidget {
  const _SalesTile({
    super.key,
    required this.data,
  });

  final CompaniesDataTile data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          data.sales,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Icon(
          data.salesType == 'up'
              ? Icons.arrow_upward_outlined
              : Icons.arrow_downward_rounded,
          color: data.salesType == 'up' ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}

class _ViewsTile extends StatelessWidget {
  const _ViewsTile({
    super.key,
    required this.data,
  });

  final CompaniesDataTile data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.views,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          data.time,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 10,
          ),
        )
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    super.key,
    required this.data,
  });

  final CompaniesDataTile data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: data.color.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Icon(
              data.icon,
              color: data.color,
              size: 18,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(data.type),
      ],
    );
  }
}

class HeaderTableTrendingProducts extends StatelessWidget {
  const HeaderTableTrendingProducts(
      {super.key, this.flex = 1, required this.text});

  final int flex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SelectableText(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 11,
          color: Color(0Xff6e6b7b),
        ),
      ),
    );
  }
}

class ProductTableElement extends StatelessWidget {
  const ProductTableElement({super.key, required this.child, this.flex = 1});

  final Widget child;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }
}

class _CompanyTile extends StatelessWidget {
  const _CompanyTile({
    super.key,
    required this.data,
  });

  final CompaniesDataTile data;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xfff8f8f8).withOpacity(0.8),
            ),
            child: SvgPicture.asset(data.assetIcon),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                data.name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              SelectableText(
                data.email,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CompaniesDataTile {
  CompaniesDataTile(
    this.name,
    this.email,
    this.assetIcon,
    this.icon,
    this.color,
    this.type,
    this.views,
    this.time,
    this.amount,
    this.sales,
    this.salesType,
  );

  final String name;
  final String email;
  final String assetIcon;
  final IconData icon;
  final Color color;
  final String type;
  final String views;
  final String time;
  final String amount;
  final String sales;
  final String salesType;
}

final List<CompaniesDataTile> companiesData = [
  CompaniesDataTile(
      'Dixons',
      'meguc@ruj.io',
      'assets/images/dashboard/company_icon_1.svg',
      Icons.computer_rounded,
      Colors.purple,
      'Technology',
      '23.4k',
      'in 24 hours',
      r'$891.2',
      '68%',
      'down'),
  CompaniesDataTile(
      'Motels',
      'vecav@hodzi.co.uk',
      'assets/images/dashboard/company_icon_2.svg',
      Icons.coffee,
      Colors.green,
      'Grocery',
      '78k',
      'in 2 days',
      r'$668.51',
      '97%',
      'up'),
  CompaniesDataTile(
      'Zipcar',
      'davcilse@is.gov',
      'assets/images/dashboard/company_icon_3.svg',
      Icons.watch,
      Colors.orange,
      'Fashion',
      '162',
      'in 5 days',
      r'$522.29',
      '62%',
      'up'),
  CompaniesDataTile(
      'Owning',
      'us@cuhil.gov',
      'assets/images/dashboard/company_icon_4.svg',
      Icons.computer_rounded,
      Colors.purple,
      'Technology',
      '214',
      'in 24 hours',
      r'$291.01',
      '88%',
      'up'),
  CompaniesDataTile(
      'Cafés',
      'pudais@jife.com',
      'assets/images/dashboard/company_icon_5.svg',
      Icons.coffee,
      Colors.green,
      'Grocery',
      '208',
      'in 1 week',
      r'$783.93',
      '16%',
      'down'),
  CompaniesDataTile(
      'Kmart',
      'bipri@cawiw.com',
      'assets/images/dashboard/company_icon_6.svg',
      Icons.watch,
      Colors.orange,
      'Fashion',
      '990',
      'in 1 month',
      r'$780.05',
      '78%',
      'up'),
  CompaniesDataTile(
      'Payers',
      'luk@izug.io',
      'assets/images/dashboard/company_icon_7.svg',
      Icons.watch,
      Colors.orange,
      'Fashion',
      '12.9k',
      'in 12 hours',
      r'$531.49',
      '42%',
      'up'),
];
