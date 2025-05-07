part of 'pages.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgSecondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.home_outlined)),
        ],
      ),
      body: Column(
        children: [
          shimmerBox(height: 390),
          Container(
            color: Colors.white,
            height: 144,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerBox(height: 24, width: double.infinity),
                const SizedBox(height: 6),
                shimmerBox(height: 16, width: size.width * 0.5),
                const SizedBox(height: 16),
                shimmerBox(height: 32, width: size.width * 0.39),
                const SizedBox(height: 6),
                Row(
                  children: [
                    shimmerBox(height: 16, width: 58),
                    const SizedBox(width: 6),
                    shimmerBox(height: 16, width: 158),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 4,),
          Container(
            color: Colors.white,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                shimmerBox(height: 16, width: 60),
                shimmerBox(height: 16, width: 70),
              ],
            ),
          ),
          SizedBox(height: 2,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: 144,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerBox(height: 20, width: size.width),
                const SizedBox(height: 6),
                shimmerBox(height: 20, width: size.width),
                const SizedBox(height: 6),
                shimmerBox(height: 20, width: size.width),
                const SizedBox(height: 6),
                shimmerBox(height: 20, width: size.width * 0.5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
