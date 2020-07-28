import "package:flutter/material.dart";

class NoRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Flexible(
              child: Container(
                height: 200,
                child: Image.asset(
                  "assets/images/waiting.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top:15),
                child: Text("No Record Found"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
