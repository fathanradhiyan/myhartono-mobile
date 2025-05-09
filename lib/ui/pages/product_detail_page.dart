part of 'pages.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  bool isLoading = false;
  bool eventStart = true;

  final List<String> imgList = [
    SharedImage.bannerOne,
    SharedImage.bannerTwo,
    SharedImage.bannerThree,
  ];

  @override
  void initState() {
    super.initState();
    simulateLoading();
  }

  void simulateLoading() {
    setState(() => isLoading = true); // Set true dulu

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgSecondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined)),
        ],
      ),
      body: Column(
        children: [
          if (isLoading)
            ..._buildShimmerContent(size)
          else
            ..._buildMainContent(size),
        ],
      ),
    );
  }

  List<Widget> _buildMainContent(Size size) {
    return [
      Container(
        height: 390,
        color: Colors.indigo,
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: size.width,
                height: 179,
                child: CarouselSlider(
                  items:
                      imgList
                          .map(
                            (item) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          )
                          .toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    aspectRatio: 2.5,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 24,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${_current + 1} dari ${imgList.length}',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 60,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [errorColor600, errorSecondaryColor]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            eventStart
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      SharedString.eventName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Stack(
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
                              width: widget.product.quantity!.toDouble(),
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8,),
                        Text(
                          'Sisa ${widget.product.quantity} lagi',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      SharedString.eventName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Mulai dalam 2 hari!',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
            eventStart
                ? Container(
                  height: 24,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 4,
                  ),
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
                          text: '02 : 02 : 02',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
                : Container(
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
                            ).textTheme.bodyMedium?.copyWith(
                              color: errorSecondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
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
        height: size.height * 0.25,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        widget.product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.favorite_border, color: btnTertiary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 28,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Member Point
                    Container(
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                        color: bgSecondary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Icon(Icons.g_mobiledata, color: mainColor),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Penawaran khusus tersedia',
                              maxLines: 1,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: textTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 4),
                    // Address Info
                    Container(
                      width: size.width * 0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                        color: bgSecondary,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Icon(Icons.g_mobiledata, color: mainColor),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Aman dengan Garansi Eksternal',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: textTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rp${widget.product.price}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  widget.product.realPrice != null ? Text(
                    'Rp${widget.product.realPrice}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: textPlaceholder,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: textPlaceholder,
                    ),
                  ): SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Cicilan mulai dari Rp1.749.833/bulan',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: textSecondary),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 16, color: textSecondary),
                ],
              ),
            ),
          ],
        ),
      ),
      Spacer(),
      Container(
        height: size.height * 0.1,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomButtonWidget(height: 44, width: 44, onClick: () {}, icon: Icon(
                Icons.comment_outlined,
                size: 20,
                color: btnTertiary,
              ),)
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      onClick: () {},
                      text: 'Bandingkan',
                      icon: Icon(
                        Icons.compare_arrows,
                        color: btnTertiary,
                        size: 12,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomButtonWidget(
                      onClick: () {},
                      text: 'Keranjang',
                      icon: Icon(Icons.add, color: Colors.white, size: 12),
                      color: Colors.white,
                      isGradient: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildShimmerContent(Size size) {
    return [
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
      SizedBox(height: 4),
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
      SizedBox(height: 2),
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
    ];
  }
}
