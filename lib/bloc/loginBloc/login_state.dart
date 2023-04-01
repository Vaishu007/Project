
abstract class loginState{}
class logIntialState extends loginState{}
class logValidState extends loginState{}
class logErrorState extends loginState{
  logErrorState(this.msg);
  String msg;
}