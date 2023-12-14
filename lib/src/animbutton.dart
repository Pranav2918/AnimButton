import 'package:flutter/material.dart';

class AnimButton extends StatefulWidget {
  final String label;
  final double height;
  final double width;
  final double borderRadius;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Curve animationCurve;
  final TextStyle textStyle;
  final double animationBegin;
  final double animationEnd;
  const AnimButton(
      {super.key,
      required this.label,
      this.height = 45.0,
      this.width = 100.0,
      this.borderRadius = 8.0,
      required this.onPressed,
      this.buttonColor = Colors.lightBlueAccent,
      this.animationCurve = Curves.easeInOut,
      this.textStyle = const TextStyle(
          color: Colors.white, fontSize: 15.0, letterSpacing: 1.0),
      this.animationBegin = 1.0,
      this.animationEnd = 0.75});

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
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.75).animate(
      CurvedAnimation(
          parent: _animationController, curve: widget.animationCurve),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward().then((value) {
          _animationController.reverse();
          widget.onPressed();
        });
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: widget.textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
