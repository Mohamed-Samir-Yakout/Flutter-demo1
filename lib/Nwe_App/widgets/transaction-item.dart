import 'package:demo1/Nwe_App/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColorDark,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete_forever),
                label: Text('Delete'))
            : IconButton(
                color: Theme.of(context).errorColor,
                icon: Icon(Icons.delete_forever),
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
