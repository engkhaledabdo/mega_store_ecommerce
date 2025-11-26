import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    required this.onPressedSearch,
    required this.onPressedFavorite,
    this.onChanged,
    required this.mycontroller,
  });
  final String titleAppBar;
  final void Function() onPressedFavorite;

  final void Function() onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                // isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: onPressedSearch),
                hintText: titleAppBar,
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(width: 5),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressedFavorite,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: Colors.grey[600],
                )),
          ),
        ],
      ),
    );
  }
}
