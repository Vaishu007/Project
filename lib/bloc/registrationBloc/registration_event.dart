abstract class Registration_event {}

class regTextChangedEvent extends Registration_event {
  regTextChangedEvent(
      this.name, this.address, this.email, this.mobile, this.password);

  String name, mobile, email, password, address;
}
