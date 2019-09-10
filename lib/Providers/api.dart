import 'package:http/http.dart' as http;
import 'package:big/model/User.dart';

class Api {
String server = "http://18.217.190.199/api/auth/customer/";



  register(String apiurl, User user) {
    String fullurl = server + apiurl;
    var response = http.post(fullurl, body: {
      'name': user.getName(),
      'email': user.getEmail(),
      'password': user.getPassword(),
      'code': user.getCode(),
      'type': user.getType(),
      'device_id': user.getdeviceId(),
      "phone": user.getPhone(),
      "phone_country": user.getPhoneCountry()
    });
  }




  phoneVerify(String apiurl, User user) {
    String fullurl = server + apiurl;
    var response = http.post(fullurl, body: {
      "phone": user.getPhone(),
      "phone_country": user.getPhoneCountry()
    });

    

  }
}
