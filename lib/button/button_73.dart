import 'package:flutter/material.dart'  hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Button73 extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const Button73({super.key, required this.text, required this.onTap});

  @override
  State<Button73> createState() => _Button73State();
}

class _Button73State extends State<Button73> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool isHovering = _isHovered || _isPressed;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() {
        _isHovered = false;
        _isPressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          transform: Matrix4.identity()
            ..scale(
              _isPressed
                  ? 1.025
                  : _isHovered
                  ? 1.125
                  : 1.0,
            ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width > 768 ? 24 : 20,
            vertical: MediaQuery.of(context).size.width > 768 ? 18 : 16,
          ),
          decoration: BoxDecoration(
            color: isHovering ? const Color(0xFFFFC229) : Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: isHovering
                    ? const Color(0xFFFF6314)
                    : const Color(0xFFADCFFF),
                offset: isHovering ? const Offset(0, -6) : const Offset(0, -12),
                blurRadius: isHovering ? 8 : 6,
                inset: true, // Flutter 3.16+
              ),
            ],
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 768 ? 24 : 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
