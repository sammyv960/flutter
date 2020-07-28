import "package:flutter/material.dart";
import "package:intl/intl.dart";

import './common/noRecord.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactionController;
  TransactionList(this.transactions, this.deleteTransactionController);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: transactions.isEmpty
          ? NoRecord()
          : ListView.builder(
              // better performance using listview builder as it only load those visible
              // it has infinite height
              itemBuilder: (ctx, index) {
                return TransactionCard(
                  id: transactions[index].id,
                  title: transactions[index].title,
                  amount: transactions[index].amount,
                  date: transactions[index].date,
                  deleteTransactionController: deleteTransactionController,
                );
              },
              itemCount: transactions.length,
            ),
    );
    // Traditional way using column to display listing
    // return Column(
    //   children: transactions.map((transaction) {
    //     return TransactionCard(
    //       id: transaction.id,
    //       title: transaction.title,
    //       amount: transaction.amount,
    //       date: transaction.date,
    //     );
    //   }).toList(),
    // );
  }
}

// Transaction card widget
class TransactionCard extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteTransactionController;

  TransactionCard({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
    @required this.deleteTransactionController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            "\$${amount.toStringAsFixed(2)}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Theme.of(context).primaryColor),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .title, // reference style from the theme
        ),
        subtitle: Text(
          DateFormat("yyyy/MM/dd HH:mm:ss").format(date),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.clear),
          color: Theme.of(context).errorColor,
          // onPressed: deleteTransactionController, // if no argument needed
          onPressed: () => deleteTransactionController(id), // if argument needed to pass in
        ),
        // isThreeLine: true, // three line space height
        // onTap: () {},
      ),
    );
  }
}
