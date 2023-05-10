import 'package:voyage2/model/contact.model.dart';
import 'package:voyage2/utils/contact.database.dart';

class ContactService {
  ContactDatabase contactDatabase = ContactDatabase();

  Future<List<Contact>> listeContacts() async {
    var contacts = await contactDatabase.recuperer();
    return contacts.map((item) => Contact.fromJson(item)).toList();
  }

  Future<bool> ajouterContact(Contact c) async {
    int res = await contactDatabase.inserer(c);
    return res > 0 ? true : false;
  }

  Future<bool> modifierContact(Contact c) async {
    int res = await contactDatabase.modifier(c);
    return res > 0 ? true : false;
  }

  Future<bool> supprimerContact(Contact c) async {
    int res = await contactDatabase.supprimer(c);
    return res > 0 ? true : false;
  }
}
