part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final double? height;
  final GestureTapCallback onClick;
  final String text;
  final Color? color;
  final Widget icon;
  final bool isGradient;
  const CustomButtonWidget(this.context, {
    super.key,
    this.height, required this.onClick, required this.text, this.color, required this.icon, this.isGradient = false,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          height: height ?? 44,
          decoration: BoxDecoration(
            color: isGradient ? null : color ?? Colors.white,
            gradient: isGradient
                ? LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [brandColor400, brandColor500],
            )
                : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 8,),
              Text(text.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),),
            ],
          )
      ),
    );
  }
}