import 'package:flutter/material.dart';
import './transaction_form.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
        title: 'Weekly Groceries',
        amount: 70.99,
        date: DateTime.now(),
        id: 't2')
  ];

  void _newTransaction(String tittle, double amount, DateTime date) {
    final newTx = Transaction(
      title: tittle,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NewTransaction(_newTransaction),
          //TransactionList(_userTransactions, ),
        ],
      ),
    );
  }
}
