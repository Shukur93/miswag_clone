import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class GradiantSliderButton extends StatefulWidget {
  final double height = 60;
  final animationDuration = const Duration(milliseconds: 300);
  final String? text;
  final Function() onSlided;
  final bool enabled;
  final GradiantSliderButtonController? controller;
  const GradiantSliderButton(
      {required this.onSlided,
      this.text,
      this.controller,
      this.enabled = true,
      super.key});

  @override
  State<GradiantSliderButton> createState() => _GradiantSliderButtonState();
}

class GradiantSliderButtonController extends ChangeNotifier {
  void reset() {
    notifyListeners();
  }
}

class _GradiantSliderButtonState extends State<GradiantSliderButton>
    with SingleTickerProviderStateMixin {
  double _sliderRelativePosition = 0.0; // values 0 -> 1
  double _startedDraggingAtX = 0.0;
  late final AnimationController _animationController;
  late final Animation _sliderAnimation;

  bool _isConfirmed = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(reset);
    }
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _sliderAnimation =
        CurveTween(curve: Curves.easeInQuad).animate(_animationController);

    _animationController.addListener(() {
      setState(() {
        _sliderRelativePosition = _sliderAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void reset() {
    _animationController.reverse(from: _sliderRelativePosition);
    setState(() {
      _isConfirmed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(_radius)),
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          final sliderRadius = widget.height / 2;
          final sliderMaxX = constraints.maxWidth - 2 * sliderRadius;
          final sliderPosX = sliderMaxX * _sliderRelativePosition;
          return Stack(
            children: [
              _buildBackground(
                width: constraints.maxWidth,
                backgroundSplitX: sliderPosX + sliderRadius,
              ),
              _buildText(),
              _buildSlider(sliderMaxX: sliderMaxX, sliderPositionX: sliderPosX),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackground({
    required double width,
    required double backgroundSplitX,
  }) {
    return Row(
      children: [
        Container(
          height: widget.height,
          width: backgroundSplitX,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(topLeft: _radius, bottomLeft: _radius),
            gradient: const LinearGradient(
              transform: GradientRotation(3.14),
              stops: [0, 100],
              colors: <Color>[
                Color(0xFF9068FD),
                Color(0xFF1E3B8C),
              ],
            ),
          ),
        ),
        Container(
          height: widget.height,
          width: width - backgroundSplitX,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(topRight: _radius, bottomRight: _radius),
            gradient: const LinearGradient(
              transform: GradientRotation(6.5),
              stops: [0, 100],
              colors: <Color>[
                Color(0xFF9068FD),
                Color(0xFF1E3B8C),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _isConfirmed
          ? _buildConfirmedText()
          : _buildFadingText(), // Replace with the fading animation text.
    );
  }

  Widget _buildFadingText() {
    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Opacity(
          opacity: 1.0 - _sliderRelativePosition, // Fade effect
          child: Center(
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: ColorsManager.disableText,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.text!.toUpperCase(),
                      style: TextStyles.font16WhiteBold,
                    ),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.0, left: 2.5),
                        child: Icon(
                          Icons.keyboard_double_arrow_right,
                          size: 22,
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmedText() {
    return SizedBox(
      height: widget.height, // Constrain height
      width: double.infinity, // Constrain width
      child: Stack(
        children: [
          // This is the animated confirmation text
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            left: _isConfirmed
                ? MediaQuery.of(context).size.width / 2 - 100 // Move to center
                : 0, // Starts from the left
            top: 0,
            bottom: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CONFIRMED',
                  style: TextStyles.font16WhiteBold,
                ),
                const SizedBox(width: 8), // Space between text and icon
                const Icon(
                  Icons.done_all,
                  color: ColorsManager.white,
                  size: 22,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider({
    required double sliderMaxX,
    required double sliderPositionX,
  }) {
    return Positioned(
      left: sliderPositionX + 5,
      child: GestureDetector(
        onHorizontalDragStart: (start) {
          if (!widget.enabled) return;
          _startedDraggingAtX = sliderPositionX;
          _animationController.stop();
        },
        onHorizontalDragUpdate: (update) {
          if (!widget.enabled) return;
          final newSliderPositionX =
              _startedDraggingAtX + update.localPosition.dx;
          final newSliderRelativePosition = newSliderPositionX / sliderMaxX;
          setState(() {
            _sliderRelativePosition =
                max(0, min(0.97, newSliderRelativePosition));
          });
        },
        onHorizontalDragEnd: (end) {
          if (!widget.enabled) return;
          if (_sliderRelativePosition >= 0.97) {
            setState(() {
              _isConfirmed = true;
            });
            widget.onSlided();
          } else {
            reset();
          }
        },
        child: SizedBox(
          height: widget.height,
          width: widget.height,
          child: SvgPicture.asset('assets/icons/tbd_slide_icon.svg'),
        ),
      ),
    );
  }

  Radius get _radius => const Radius.circular(16);
}
