import 'package:flutter/material.dart';

/// A highly customizable animated button that provides visual feedback on tap.
///
/// Use [AnimButton] to easily add a scaling animation to any button.
/// It supports custom labels, child widgets, colors, gradients, and more.
class AnimButton extends StatefulWidget {
  /// The text to display inside the button.
  /// If [child] is provided, this will be ignored.
  final String? label;

  /// A custom widget to display inside the button.
  /// If provided, [label] will be ignored.
  final Widget? child;

  /// The height of the button. Defaults to 45.0.
  final double? height;

  /// The width of the button. Defaults to 100.0.
  final double? width;

  /// The border radius of the button. Defaults to 8.0.
  final double borderRadius;

  /// Callback function called when the button is pressed.
  final VoidCallback onPressed;

  /// The background color of the button.
  /// This is ignored if [gradient] is provided.
  final Color buttonColor;

  /// An optional gradient for the button background.
  final Gradient? gradient;

  /// The curve to use for the scaling animation.
  final Curve animationCurve;

  /// The text style for the button label.
  final TextStyle textStyle;

  /// The starting scale value for the animation. Defaults to 1.0.
  final double animationBegin;

  /// The ending scale value for the animation when pressed. Defaults to 0.75.
  final double animationEnd;

  /// The duration of the scale down animation.
  final Duration duration;

  /// The internal padding of the button.
  final EdgeInsetsGeometry? padding;

  /// The external margin of the button.
  final EdgeInsetsGeometry? margin;

  /// A list of shadows to apply to the button.
  final List<BoxShadow>? boxShadow;

  /// Alignment for the text inside the butotn
  final TextAlign? alignment;

  /// Creates an [AnimButton].
  const AnimButton({
    super.key,
    this.label,
    this.child,
    this.height = 45.0,
    this.width = 100.0,
    this.borderRadius = 8.0,
    required this.onPressed,
    this.buttonColor = Colors.lightBlueAccent,
    this.gradient,
    this.animationCurve = Curves.easeInOut,
    this.alignment = TextAlign.center,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 15.0,
      letterSpacing: 1.0,
    ),
    this.animationBegin = 1.0,
    this.animationEnd = 0.75,
    this.duration = const Duration(milliseconds: 150),
    this.padding,
    this.margin,
    this.boxShadow,
  }) : assert(label != null || child != null, 'Either label or child must be provided.');

  @override
  State<AnimButton> createState() => _AnimButtonState();
}

class _AnimButtonState extends State<AnimButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: widget.animationBegin,
      end: widget.animationEnd,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _animationController.duration = widget.duration;
    }
    if (oldWidget.animationBegin != widget.animationBegin ||
        oldWidget.animationEnd != widget.animationEnd ||
        oldWidget.animationCurve != widget.animationCurve) {
      _scaleAnimation = Tween<double>(
        begin: widget.animationBegin,
        end: widget.animationEnd,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: widget.animationCurve,
        ),
      );
    }
  }

  Future<void> _handleTap() async {
    await _animationController.forward();
    await _animationController.reverse();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _handleTap,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            margin: widget.margin,
            width: widget.width,
            height: widget.height,
            padding: widget.padding ??
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: widget.gradient == null ? widget.buttonColor : null,
              gradient: widget.gradient,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: widget.boxShadow,
            ),
            child: Center(
              child: widget.child ??
                  Text(
                    widget.label!,
                    textAlign: widget.alignment,
                    style: widget.textStyle,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
