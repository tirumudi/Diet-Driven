import 'package:dietdriven/domain/user.dart';

/// Interface for user authentication and authorization.
abstract class AuthenticationRepository {
  /// Notifies about changes to the user's sign-in state (null for lack of user).
  Stream<User> authStateChanges();

  /// Sends a sign in with email link to provided email address.
  Future<void> sendSignInLinkToEmail(String email);

  /// Signs in using an email address and email sign-in link.
  Future<void> signInWithEmailLink(String email, String emailLink);

  /// Signs out the current user.
  Future<void> signOut();
}