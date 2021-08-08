import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime dateInput;

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final dateController = TextEditingController();

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty || dateInput == null) {
      return;
    }

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      dateInput,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'tittle'),
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              // TextField(
              //   controller: dateController,
              //   decoration: InputDecoration(labelText: 'Date'),
              //   keyboardType: TextInputType.datetime,
              // ),
              DateTimeFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Date',
                ),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  dateInput = value;
                },
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitData,
                child: Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
