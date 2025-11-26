import 'package:flutter/material.dart';

class CustomAppBarCart extends StatelessWidget {
  const CustomAppBarCart({super.key, this.onPressedBack, required this.title});
  final void Function()? onPressedBack;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
          )),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
