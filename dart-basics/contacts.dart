void main() {
  Contact contactOne = Contact(name: 'Jack One');
  Contact contactTwo = Contact(name: 'Tracy Two', phone: '+87812300123');
  contactOne.makeAPurchase();

  contactTwo.showAllContacts();

  contactOne.deleteContact();

  contactTwo.showAllContacts();
}

class Contact {
  late String _name;
  late String _phone;
  late DateTime _recentPurchase;

  String get name => _name;
  set setName(String newName) {
    if (newName.isEmpty) this._name = 'Default Name'; 
    else this._name = newName;
  }

  String get phone => _phone;
  set setPhone(String newPhone) {
    if (newPhone.isEmpty) this._phone = 'No phone';
    else this._phone = newPhone;
  }

  DateTime get recentPurchase => _recentPurchase;
  set setRecentPurchase(DateTime dateOfPurchase) {
    if (dateOfPurchase.toString().isEmpty) this._recentPurchase = DateTime(2000);
    else this._recentPurchase = dateOfPurchase;
  }

  Contact({required String name, String phone = ''}) {
    this.setName = name;
    this.setPhone = phone;
    this.setRecentPurchase = DateTime(2000);
    ContactDB.allContacts.add(this);
  }

  void makeAPurchase() {
    this.setRecentPurchase = DateTime.now();
  }

  void showAllContacts() {
    ContactDB.allContacts.forEach((element) => print('Name: ${element.name}; Phone: ${element.phone}; Date of recent purchase: ${element.recentPurchase}'));
  }

  void deleteContact() {
    ContactDB.allContacts.removeWhere((element) => (element.name == this.name && element.phone == this.phone && element.recentPurchase == this.recentPurchase));
  }
}

abstract class ContactDB {
  static List<Contact> allContacts = [];
}