import 'package:flutter/material.dart';
import 'package:flutterxy/utils/styles_values.dart';
import 'package:flutterxy/widgets/basic_elevated_container.dart';
import 'package:flutterxy/widgets/standard_button.dart';

class CartProductsMenu extends StatelessWidget {
  const CartProductsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BasicElevatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Cart',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Chip(
                  label: const Text(
                    '4 Items',
                    style: TextStyle(
                      color: StyleValues.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  backgroundColor: StyleValues.primaryColor.withOpacity(0.2),
                ),
              ],
            ),
            const Divider(),
            ...items.map(
              (element) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CartProductTile(
                      product: element,
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    r'$2799.26',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: StyleValues.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const StandardButton(
              label: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}

class CartProductTile extends StatefulWidget {
  const CartProductTile({super.key, required this.product});

  final CartItemTile product;

  @override
  State<CartProductTile> createState() => _CartProductTileState();
}

class _CartProductTileState extends State<CartProductTile> {
  late int selectedQuantity;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    selectedQuantity = widget.product.quantity;
    totalPrice = selectedQuantity * widget.product.amount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xfff8f8f8).withOpacity(0.8),
          ),
          child: Image.asset(
            widget.product.productAsset,
            height: 40,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'by ${widget.product.brand}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: GestureDetector(
                onTap: () {
                  selectedQuantity =
                      selectedQuantity == 1 ? 1 : selectedQuantity - 1;
                  totalPrice = selectedQuantity * widget.product.amount;
                  setState(() {});
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(selectedQuantity.toString()),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: StyleValues.primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: GestureDetector(
                onTap: () {
                  selectedQuantity++;
                  totalPrice = selectedQuantity * widget.product.amount;
                  setState(() {});
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          '\$$totalPrice',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

final List<CartItemTile> items = [
  CartItemTile('Google - Google Home Pod', 'Google', 129.29, 1,
      'assets/images/cart/google_product.png'),
  CartItemTile('Apple iPhone 11 (64GB, Black)', 'Apple', 669.99, 1,
      'assets/images/cart/iphone_product.png'),
  CartItemTile('Apple iMac 27-inch', 'Apple', 999.99, 1,
      'assets/images/cart/imac_product.png'),
  CartItemTile('Apple - MacBook Air® (Latest Model) - 13.3" Display - Silver',
      'Apple', 999.99, 1, 'assets/images/cart/mac_product.png'),
];

class CartItemTile {
  CartItemTile(
      this.name, this.brand, this.amount, this.quantity, this.productAsset);

  final String name;
  final String brand;
  final double amount;
  final int quantity;
  final String productAsset;
}
