import 'package:rxdart/rxdart.dart';

class Bloc {
  // Input
  final _id = PublishSubject<String>();
  final _pwd = PublishSubject<String>();
  final _submit = PublishSubject<bool>();

  // Output
  get id => _id.stream;
  get pwd => _pwd.stream;
  get submit => _submit.stream;

  setId(String txt) => _id.sink.add(txt);
  setPwd(String txt) => _pwd.sink.add(txt);

  dispose() {
    _id.close();
    _pwd.close();
    _submit.close();
  }
}