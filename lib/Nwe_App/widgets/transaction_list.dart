import './transaction-item.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constriants) {
            return Column(
              children: [
                Text(
                  'No Transactions yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constriants.maxHeight * 0.7,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: widget.transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: widget.transactions[index],
                  deleteTx: widget.deleteTransaction);
            },
          );
  }
}
