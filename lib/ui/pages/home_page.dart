part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  bool isCollapsed = false;

  int? memberPoint = 552;

  bool isLoading = false;

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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            final collapsed =
                scrollNotification.metrics.pixels >= (120 - kToolbarHeight);
            if (collapsed != isCollapsed) {
              setState(() {
                isCollapsed = collapsed;
              });
            }
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            buildSliverAppBar(size),
            if (isLoading)
              ..._buildShimmerContent(size)
            else
              ..._buildMainContent(size),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar(Size size) {
    return SliverAppBar(
      backgroundColor: isCollapsed ? Colors.white : brandColor500,
      expandedHeight: 136,
      pinned: true,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.biggest.height;
          const double collapseThreshold = kToolbarHeight + 52;
          final isCollapsed = top <= collapseThreshold;
          print(
            "Current height: $top, Current collapseThreshold: $collapseThreshold",
          );
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            color: isCollapsed ? Colors.white : brandColor500,
            child: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(start: 16, bottom: 12),
              title:
                  isCollapsed
                      ? Container(
                        width: size.width * 0.6,
                        height: 36,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderPrimary),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Icon(Icons.search, size: 20, color: mainColor),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                SharedString.searchHomeHintText,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: textPlaceholder),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                      : null,
              background: Container(
                padding: const EdgeInsets.only(top: 52, left: 16, right: 16),
                color: brandColor500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(SharedImage.profilePic),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  SharedString.greeting,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  SharedString.username,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(Icons.search, size: 20, color: Colors.white),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              SharedString.searchHomeHintText,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.comment_outlined,
            color: isCollapsed ? Colors.black : Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_none_outlined,
            color: isCollapsed ? Colors.black : Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: isCollapsed ? Colors.black : Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  List<Widget> _buildMainContent(Size size) {
    return [
      SliverToBoxAdapter(
        child: Container(
          height: 179,
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: size.width * 0.9,
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
                      autoPlay: true,
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
                left: 24,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 6,
                            height: 6,
                            margin: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          height: 40,
          margin: EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              // Member Point
              Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: bgSecondary,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        memberPoint != null
                            ? Icons.card_giftcard
                            : Icons.credit_card,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        memberPoint != null
                            ? 'Poin $memberPoint'
                            : 'Upgrade to HPC!',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4),
              // Address Info
              Container(
                height: 40,
                width: 291,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: bgSecondary,
                ),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.location_pin, color: mainColor)),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Dikirim ke Rumah Stephen Giovanni Saputra',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
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
      SliverToBoxAdapter(
        child: Container(
          height: 96,
          padding: EdgeInsets.only(left: 16),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: List.generate(8, (index) {
              return Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(SharedImage.profilePic),
                      ),
                    ),
                  ),
                  Text(
                    'Menu Name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(fontSize: 10),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: CustomSectionWidget(
          title: 'Sat Set Flash Sale',
          itemHeight: 272,
          subtitle: Row(
            children: [
              Text(
                "Berakhir dalam ",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: textSecondary),
              ),
              Container(
                width: 99,
                height: 20,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                      const WidgetSpan(child: SizedBox(width: 6)),
                      TextSpan(
                        text: '02 : 02 : 02',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          seeDetailTapped: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => new SectionDetailPage(),
              ),
            );
          },
          itemCount: dummyProducts.length,
          item: (index) {
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
                isSale: true,
                rating: item.rating
              ),
              isSale: true,
            );
          },
        ),
      ),
      SliverToBoxAdapter(
        child: CustomSectionWidget(
          title: 'Belanja dari Official Brand Shop',
          itemHeight: 240,
          subtitle: Text(
            "Dikelola langsung oleh MyHartono",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: textSecondary),
          ),
          seeDetailTapped: () {},
          itemCount: officialBrands.length,
          item: (index) {
            final brand = officialBrands[index];
            return BrandShopCard(officialBrand: OfficalBrand(title: brand.title, image: brand.image, backgroundImage: brand.backgroundImage),);
          },
        ),
      ),
    ];
  }

  List<Widget> _buildShimmerContent(Size size) {
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: shimmerBox(height: 179), // carousel placeholder
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 96,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder:
                (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        shimmerBox(height: 52, width: 52),
                        const SizedBox(height: 8),
                        shimmerBox(height: 32, width: 64),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          height: 44,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(height: 24, width: double.infinity),
              const SizedBox(height: 4),
              shimmerBox(height: 16, width: size.width * 0.5),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 232,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder:
                (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      shimmerBox(height: 144, width: 144),
                      const SizedBox(height: 8),
                      shimmerBox(height: 32, width: 144),
                      SizedBox(height: 4),
                      shimmerBox(height: 20, width: 86),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          shimmerBox(height: 16, width: 16),
                          SizedBox(width: 2),
                          shimmerBox(height: 16, width: 16),
                        ],
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          height: 44,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(height: 24, width: double.infinity),
              const SizedBox(height: 4),
              shimmerBox(height: 16, width: size.width * 0.5),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 232,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder:
                (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      shimmerBox(height: 144, width: 144),
                      const SizedBox(height: 8),
                      shimmerBox(height: 32, width: 144),
                      SizedBox(height: 4),
                      shimmerBox(height: 20, width: 86),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          shimmerBox(height: 16, width: 16),
                          SizedBox(width: 2),
                          shimmerBox(height: 16, width: 16),
                        ],
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ),
    ];
  }
}
