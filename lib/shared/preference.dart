import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  String _userId;
  String _userName;
  String _userImageUrl;
  String _userToken;

  String get userId => this._userId;
  String get userName => this._userName;
  String get userImageUrl => this._userImageUrl;
  String get userToken => this._userToken;

  SharedPreferences _internal;

  static final _instance = new Preference._();

  Preference._();

  factory Preference() {
    return _instance;
  }

  Future<void> warmUp(GoogleSignInAccount account) async {
    this._internal = await SharedPreferences.getInstance();

    final auth = await account.authentication;
    this._userId = await this
        ._initializeOrGet("userId", ifAbsent: () => Uuid().v4().toString());
    this._userToken = auth.accessToken;
    this._userName = await this
        ._initializeOrGet("userName", ifAbsent: () => account.displayName);
    this._userImageUrl = this._internal.getString('userImageUrl');

    print('Preference is ready.');
    print(' - userId:    ${this._userId}');
    print(' - userToken: ${this._userToken}');
    print(' - userName:  ${this._userName}');
    print(' - userImage: ${this._userImageUrl}');
  }

  Future<void> updateProfile(String name, String imageUrl) async {
    await this._internal.setString('userName', name);
    await this._internal.setString('userImageUrl', imageUrl);
    this._userName = name;
    this._userImageUrl = imageUrl;
  }

  Future<String> _initializeOrGet(String key,
      {String Function() ifAbsent}) async {
    final value = this._internal.getString(key);
    if (value != null) {
      return value;
    }
    final defaultValue = ifAbsent();
    await this._internal.setString(key, defaultValue);
    return defaultValue;
  }
}

String getUserId() => Preference().userId;
String getUserToken() => Preference().userToken;
