part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback onClick;
  final String? text;
  final Widget? icon;
  final bool isGradient;
  final bool isMainGradient;
  final Color? color;
  final Color? fontColor;

  const CustomButtonWidget({
    super.key,
    this.height,
    this.width,
    required this.onClick,
    this.text,
    this.icon,
    this.isGradient = false,
    this.isMainGradient = true,
    this.color, this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveTextColor =
    isGradient ? Colors.white : (fontColor ?? textPrimary);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onClick,
        splashColor:
        isGradient ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.1),
        highlightColor:
        isGradient ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05),
        child: Ink(
          height: height ?? 44,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: isGradient
                ? LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isMainGradient
                  ? [brandColor400, brandColor500]
                  : [errorColor400, errorColor600],
            )
                : null,
            color: isGradient ? null : color ?? Colors.white,
            border: isGradient ? null : Border.all(color: borderPrimary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              if (icon != null && text != null) SizedBox(width: 8),
              if (text != null)
                Text(
                  text!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: effectiveTextColor,
                    fontWeight: FontWeight.w500
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
