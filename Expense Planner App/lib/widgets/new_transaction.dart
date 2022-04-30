import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
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
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No Date Chosen!'),
                  TextButton(
                    // style: ButtonStyle(
                    //   foregroundColor: MaterialStateProperty.all<Color>(
                    //       Theme.of(context).primaryColor),
                    //   // textStyle: TextStyle(
                    //   //   fontWeight:
                    //   // )
                    // ),
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),

                    onPressed: () {},
                    child: Text('Choose Date'),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).textTheme.button.color),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
