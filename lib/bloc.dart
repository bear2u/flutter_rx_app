import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Bloc {
  // Input
  final _id = PublishSubject<String>();
  final _pwd = PublishSubject<String>();
  final _submit = PublishSubject<bool>();

  // Output
  Observable<String> get id => _id.stream;
  Observable<String> get pwd => _pwd.stream;
  get submit => _submit.stream;

  StreamSubscription ss;

  Bloc() {
    ss = Observable.combineLatest2(id,pwd, (String id, String pwd)  {
          print('id => $id, pwd => $pwd');
          return id.length > 0 && pwd.length > 0;
        })
        .doOnData((data) => print(data))
        .listen((enable) => _submit.sink.add(enable));
//        .pipe(submit);
  }

  setId(String txt) {
    print(txt);
    _id.sink.add(txt);
  }
  setPwd(String txt) => _pwd.sink.add(txt);

  dispose() async {
    _id.close();
    _pwd.close();
    _submit.close();

    await ss.cancel();
  }
}