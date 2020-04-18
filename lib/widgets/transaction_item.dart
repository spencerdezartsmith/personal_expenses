import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
    // forward key to the parent widget
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  deleteTx(transaction.id);
                },
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  deleteTx(transaction.id);
                },
              ),
        title:
            Text(transaction.title, style: Theme.of(context).textTheme.title),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
      ),
    );
  }
}
