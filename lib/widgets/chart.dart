import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        int txDay = recentTransactions[i].date.day;
        int txMonth = recentTransactions[i].date.month;
        int txYear = recentTransactions[i].date.year;
    
        if (txDay == weekDay.day && txMonth == weekDay.month && txYear == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          ...groupedTransactionValues.map((data) {
            return Text('${data['day']} : ${data['amount']}');
          }).toList(),
        ]
      )
    );
  }
}