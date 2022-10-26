import 'package:flutter/material.dart';

class NewTrtansactions extends StatefulWidget {
  final Function addNewTransaction;
  NewTrtansactions(this.addNewTransaction);

  @override
  State<NewTrtansactions> createState() => _NewTrtansactionsState();
}

class _NewTrtansactionsState extends State<NewTrtansactions> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final String titleLable = 'Title';
  final String amountLable = 'Amount';
  void submitData() {
    final enteredTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enterdAmount <= 0) {
      return;
    }
    widget.addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: titleLable),
              // onChanged: (val) => titleInput = val,
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: amountLable),
              // onChanged: (val) => amountString = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: Text('Add Transaction'),
                onPressed: submitData),
          ],
        ),
      ),
    );
  }
}
