import 'package:ecommerce/common_widgets/pricea_row.dart';
import 'package:flutter/material.dart';

class PriceCalculatingComponent extends StatelessWidget {
  const PriceCalculatingComponent({
    super.key,
    required this.subtotalprice,
    required this.shppingcost,
    required this.tax,
    required this.total,
  });
  final String subtotalprice;
  final String shppingcost;
  final String tax;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PriceRow(
          pricecetegory: 'Subtotal',
          price: subtotalprice,
          fontfamily: 'GT-Regular',
          fontfamily2: 'GT-Regular',
        ),
        PriceRow(
          pricecetegory: 'Shipping Cost',
          price: shppingcost,
          fontfamily: 'GT-Regular',
          fontfamily2: 'GT-Regular',
        ),
        PriceRow(
          pricecetegory: 'Tax',
          price: tax,
          fontfamily: 'GT-Regular',
          fontfamily2: 'GT-Regular',
        ),
        PriceRow(
          pricecetegory: 'Total',
          price: total,
          fontfamily: 'GT-Regular',
          fontfamily2: 'GT-Bold',
        ),
      ],
    );
  }
}
