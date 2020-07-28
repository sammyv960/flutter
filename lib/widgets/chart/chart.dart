import "package:flutter/material.dart";
import "package:intl/intl.dart";
// import "dart:io";
// stderr.writeln('print me');

import "../../models/transaction.dart";
import "./chartBar.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      // print({DateFormat.E().format(weekDay).substring(0, 1), totalSum});
      return {
        // "day": DateFormat.E().format(weekDay).substring(0, 1),
        "day": DateFormat.E().format(weekDay),
        "amount": totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      // something like reduce
      return sum += item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Satistic of this week",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: groupedTransactionValues.map((data) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                        data["day"],
                        data["amount"],
                        totalSpending > 0
                            ? (data["amount"] as double) / totalSpending
                            : 0.0,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
