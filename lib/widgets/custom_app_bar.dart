import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? trailing;

  const CustomAppBar({
    super.key,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1E1E1E),
      elevation: 0,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 5,
          left: 15,
          right: 15,
          bottom: 12,
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 48,
                child: Center(child: leading ?? const SizedBox.shrink()),
              ),
              SizedBox(
                height: 48,
                child: Center(child: trailing ?? const SizedBox.shrink()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
