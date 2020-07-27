import "package:flutter/material.dart";

import './models/transaction.dart';
import './widgets/transactionAdd.dart';
import './widgets/transactionList.dart';
import './widgets/chart/chart.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(
        primarySwatch:
            Colors.red, // different shade generated from a single color
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              // global theme for entire app
              title: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          // global theme for appbar
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: "t1",
    //   title: "Adidas",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "g1",
    //   title: "Groceries",
    //   amount: 18.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "g2",
    //   title: "Groceries",
    //   amount: 37.99,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      ); // isAfter is syntax for dateTime object
    }).toList();
  }

  void _addTransactionController(
      String newTitle, double newAmount, DateTime chosenDate) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: newTitle,
      amount: newAmount,
      date: chosenDate,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransactionController(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _showModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionAdd(
            addTransactionController: _addTransactionController,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () => _showModal(context),
        //   )
        // ],
      ),
      body: Container(
        child: Column(
          children: [
            Chart(_recentTransactions),
            SizedBox(height: 20),
            TransactionList(_transactions, _deleteTransactionController),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showModal(context),
      ),
    );
  }
}
