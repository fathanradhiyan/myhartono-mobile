part of 'widgets.dart';

class CustomSectionWidget extends StatelessWidget {
  final Widget Function(int index) item;
  final String title;
  final Widget? subtitle;
  final bool hasDetail;
  final GestureTapCallback? seeDetailTapped;
  final double? itemHeight;
  final int itemCount;

  const CustomSectionWidget({
    Key? key,
    required this.item,
    required this.title,
    this.seeDetailTapped,
    this.hasDetail = true,
    this.subtitle,
    this.itemHeight,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle != null) subtitle!,
                  ],
                ),
                hasDetail
                    ? InkWell(
                      onTap: seeDetailTapped,
                      child: Text(
                        'Lihat semua',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: mainColor,
                        ),
                      ),
                    )
                    : SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: itemHeight ?? 272,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return item(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
