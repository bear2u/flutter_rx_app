import 'package:flutter/material.dart';
import 'package:flutter_rx_app/provider.dart';

void main() => runApp(
    Provider(
      child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget{

  String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    // 1. bloc
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  bloc.setId(value);
                },
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  bloc.setPwd(value);
                },
              ),
              StreamBuilder<bool>(
                stream: bloc.submit,
                builder: (context, snapshot) {
                  final isEnable = snapshot.data ?? false;
                  return RaisedButton(
                    child: Text('로그인'),
                    onPressed: isEnable ? () {} : null,
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }
}
