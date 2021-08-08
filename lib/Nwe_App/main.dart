import 'package:demo1/Nwe_App/widgets/transaction_list.dart';

import './widgets/chart.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_form.dart';
import 'models/transaction.dart';

class MyExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              button: TextStyle(
                color: Colors.white,
              )),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 24,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 100,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //     title: 'Weekly Groceries',
    //     amount: 70.99,
    //     date: DateTime.now(),
    //     id: 't2')
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void didChangeAppLifeCycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((el) {
      return el.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

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

  void _NewTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: ListView(children: [
            NewTransaction(_newTransaction),
          ]),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((el) {
        return el.id == id;
      });
    });
  }

  List<Widget> _buildLandscape(AppBar appBar, Widget txlist) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Show Chart'),
          Switch(
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              }),
        ],
      ),
      _showChart
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: Chart(
                recentTransactions: _recentTransactions,
              ),
            )
          : txlist
    ];
  }

  List<Widget> _buildPortrait(AppBar appBar, Widget txlist) {
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.3,
        child: Chart(
          recentTransactions: _recentTransactions,
        ),
      ),
      txlist
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('Expenses Planner'),
      actions: [
        IconButton(
            icon: Icon(Icons.add_rounded),
            onPressed: () => _NewTransactionForm(context))
      ],
    );
    final txlist = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isLandscape) ..._buildLandscape(appBar, txlist),
              if (!isLandscape) ..._buildPortrait(appBar, txlist),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () => _NewTransactionForm(context),
      ),
    );
  }
}
