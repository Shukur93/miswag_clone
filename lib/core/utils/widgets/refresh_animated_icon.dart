import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';

class RefreshAnimatedIcon extends StatefulWidget {
  final Future<void> Function() futureMethod;
  const RefreshAnimatedIcon({
    super.key,
    required this.futureMethod,
  });

  @override
  State<RefreshAnimatedIcon> createState() => _RefreshAnimatedIconState();
}

class _RefreshAnimatedIconState extends State<RefreshAnimatedIcon>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  _initAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  void _startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: 2 * 3.14159 * _animation.value,
            child: child,
          );
        },
        child: IconButton(
          onPressed: () async {
            await widget.futureMethod();
            _startAnimation();
          },
          icon: const Icon(
            Icons.cached,
            color: ColorsManager.gray,
            size: 27,
          ),
        ),
      ),
    );
  }
}
