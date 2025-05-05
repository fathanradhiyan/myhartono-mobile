part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String realPrice;
  final double quantity;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.realPrice,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(imageUrl, fit: BoxFit.fill),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: grayLight50,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tersedia',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: textTertiary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 8,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey4,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Container(
                              width: quantity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: quantity > 50
                                    ? greenBar
                                    : quantity > 15
                                    ? yellowBar
                                    : quantity > 0
                                    ? redBar
                                    : Colors.white10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      name.toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rp. $realPrice',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: textPlaceholder,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: textPlaceholder,
                          ),
                        ),
                        Text(
                          'Rp. $price',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
