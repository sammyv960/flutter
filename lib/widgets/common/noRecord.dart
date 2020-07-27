import "package:flutter/material.dart";

class NoRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 200,
              child: Image.asset(
                "assets/images/waiting.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              // use for spacing...
              height: 20,
            ),
            Text("No Record Found"),
          ],
        ),
      ],
    );
  }
}
