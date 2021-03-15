import 'package:sprout/services/networking.dart';

const reqresContactURL = 'https://reqres.in/api/users?per_page=12';

class ContactModel {
  Future<dynamic> getContactsData() async {

    NetworkHelper networkHelper = NetworkHelper(reqresContactURL);

    return await networkHelper.getData();
  }
}