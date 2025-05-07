part of 'pages.dart';

class SectionDetailPage extends StatefulWidget {
  const SectionDetailPage({super.key});

  @override
  State<SectionDetailPage> createState() => _SectionDetailPageState();
}

class _SectionDetailPageState extends State<SectionDetailPage> {
  bool eventStart = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgSecondary,
      appBar: AppBar(
        title: Text(SharedString.eventName),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    redOne,
                    errorSecondaryColor
                  ]
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                eventStart?
                Text('Sedang berjalan!', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),)
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(SharedString.eventName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),),
                    Text('Mulai dalam 2 hari!', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,))
                  ],
                ),
                eventStart? Container(
                  height: 24,
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: errorColor,
                  ),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.watch_later_outlined,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                        const WidgetSpan(child: SizedBox(width: 4)),
                        TextSpan(
                          text: '7 hari lagi',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ) : Container(
                  height: 36,
                  width: 142,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: buttonSecondaryErrorBg,
                  ),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.add_alert_outlined,
                              size: 20,
                              color: errorSecondaryColor,
                            ),
                          ),
                          const WidgetSpan(child: SizedBox(width: 4)),
                          TextSpan(
                            text: "Ingatkan saya",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(color: errorSecondaryColor, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            height: 36,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(8, (index) {
                return Container(
                  height: 36,
                  width: 134,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: borderPrimary),
                    color: Colors.white,
                  ),
                  child: Text(
                    "[NAMA FAMILY]", maxLines: 1, style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              physics: BouncingScrollPhysics(),
              itemCount: dummyProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.58, // Kotak (1:1)
              ),
              itemBuilder: (context, index) {
                final item = dummyProducts[index];
                return ProductCard(
                  product: Product(
                    name: item.name,
                    price: item.price,
                    realPrice: item.realPrice,
                    image: item.image,
                    quantity: item.quantity,
                    desc: item.desc,
                    type: item.type,
                    isSale: item.isSale,
                    rating: item.rating
                  ),
                  isSale: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
