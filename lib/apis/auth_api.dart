//Why Abstract class needed?
//Because of  2 main reasons
// ------1st reason-----
//this abstract class acts as interface between UI and AuthAPI
//This abstract class contains all the function related to API
//for ex: AuthAPI will contain all the function signatures(signup) of that are required
//and these abstarct class will implemented in another class(AuthAPI) where we overide these function
//signatures (signup)
//if these implementation done with firebase now,
//later we want to impleneted with superbase or any auth provider
//In this case these abstact class super useful,
//because we can just delete implemented function and can replace with any auth provider
//no need to change entire code
// ------2nd reason------
//Testing
/*
  abstract class IAuthAPI{
    void signUp(); 
    void signIn();
  }

  class AuthAPI implemennts IAuthAPI {
    @override
    void signUp(){
      ...
      ...
    }
    @override
    void signIp(){
      ...
      ...
    }
  }
*/

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<model.User> signUp({
    required String email,
    required String password,
    required String name,
  });

  FutureEither<model.Session> login({
    required String email,
    required String password,
  });

  Future<model.User?> currentUserAccount();

  FutureEitherVoid logout();
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  Future<model.User?> currentUserAccount() async {
  try {
      return await _account.get(); 
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEither<model.User> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? "Some unexpected error occurred", stackTrace));
    } on Exception catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<model.Session> login({
    required String email,
    required String password,
  }) async {
    try {
      final session = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? "Some unexpected error occurred", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
  
  @override
  FutureEitherVoid logout() async {
    try {
      await _account.deleteSession(sessionId: 'current',);
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? "Some unexpected error occurred", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
  
}
