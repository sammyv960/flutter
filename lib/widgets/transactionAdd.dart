import "package:flutter/material.dart";
import "package:intl/intl.dart";

class TransactionAdd extends StatefulWidget {
  final Function addTransactionController;

  TransactionAdd({
    @required this.addTransactionController,
  });

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _datePickerController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransactionController(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop(); // off modal, research more on it when free
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate == null ? DateTime.now() : _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }

      setState(() {
        _selectedDate = date;
        _datePickerController.text = DateFormat("yyyy/MM/dd").format(_selectedDate).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedDate);
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
                height: 80,
                child: 
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Date", icon: Icon(Icons.calendar_today)),
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  onTap: _showDatePicker,
                  controller: _datePickerController,
                  // initialValue: _selectedDate == null ? DateFormat("yyyy/MM/dd").format(_selectedDate) : ""
                  // initialValue: _selectedDate == null ? _selectedDate : ""
                )

                // Row(children: [
                //   Text("Date: "),
                //   Text(_selectedDate == null ? "No Date Chosen!" : DateFormat("yyyy/MM/dd").format(_selectedDate)),
                //   FlatButton(
                //     child: Text(
                //       "Pick Date",
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //     textColor: Theme.of(context).primaryColor,
                //     onPressed: _showDatePicker,
                //   )
                // ]),
                ),
            RaisedButton(
              child: Text("Add"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: submitData,
            )
          ]),
        ),
      ),
    );
  }
}
