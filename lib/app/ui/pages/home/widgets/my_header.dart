import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 201, 201, 201),
            blurRadius: 1,
            spreadRadius: 1.6,
          ),
        ],
      ),
    );
  }
}
