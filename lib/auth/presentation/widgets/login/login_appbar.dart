import 'package:flutter/material.dart';

PreferredSizeWidget loginAppBar(context, void Function()? onPressed) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    ),
  );
}
