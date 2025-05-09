part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final bool? isSale;
  final Product product;

  const ProductCard({
    super.key,
    required this.product, this.isSale = false
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(product: product,))),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 144,
                child: Image.asset(product.image!, fit: BoxFit.fill),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isSale!? Container(
                        color: bgSecondary,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Tersedia',
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: textTertiary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              flex: 3,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Container(
                                    width: product.quantity!.toDouble(),
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: product.quantity! > 50
                                          ? greenBar
                                          : product.quantity! > 15
                                          ? yellowBar
                                          : product.quantity! > 0
                                          ? errorColor600
                                          : Colors.white10,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ) : SizedBox(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product.name.toUpperCase(),
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
                            product.realPrice != null ? Text(
                              'Rp. ${product.realPrice}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: textPlaceholder,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: textPlaceholder,
                              ),
                            ): SizedBox(),
                            Text(
                              'Rp. ${product.price}',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            !isSale!? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Icon(Icons.star, size: 14, color: warningColor,),
                                  Text(product.rating.toString(), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: textSecondary),)
                                ],
                              ),
                            ):SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
