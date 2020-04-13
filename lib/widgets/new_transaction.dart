import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter new purchase'
            ),
            controller: titleController,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0)
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter new purchase amount'
            ),
            controller: amountController,
          ),
          FlatButton(
            onPressed: () {
              addNewTransaction(titleController.text, double.parse(amountController.text));
            },
            textColor: Colors.indigo,
            child: Text('Add Transaction')
          )
        ]
      )
    );
  }
}