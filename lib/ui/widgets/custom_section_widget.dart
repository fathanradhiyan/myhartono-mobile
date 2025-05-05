part of 'widgets.dart';

class CustomSectionWidget extends StatelessWidget {
  final List<Widget> productItem;
  final String title;
  final Widget? subtitle;
  final bool hasDetail;
  final GestureTapCallback? seeDetailTapped;

  const CustomSectionWidget({
    Key? key,
    required this.productItem, required this.title, this.seeDetailTapped, this.hasDetail = true, this.subtitle,
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if (subtitle != null) subtitle!
                  ],
                ),
                hasDetail? InkWell(
                  onTap: seeDetailTapped,
                  child: Text(
                    'Lihat semua',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                    ),
                  ),
                ) : SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: 272,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: productItem,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
