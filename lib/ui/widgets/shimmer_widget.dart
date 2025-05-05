part of 'widgets.dart';

Widget shimmerBox({double height = 100, double width = double.infinity, ShapeBorder? shape}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
        color: Colors.grey.shade300,
        shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );
}
