import 'package:flutter/material.dart';
import 'package:learning_flutter_b/kernel/utils/locator.dart';
import 'package:learning_flutter_b/modules/auth/screens/create_account.dart';
import 'package:learning_flutter_b/modules/auth/screens/login.dart';
import 'package:learning_flutter_b/modules/posts/presentation/posts.dart';
import 'package:learning_flutter_b/modules/tutorial/screens/tutorial.dart';
import 'package:learning_flutter_b/navigation/home.dart';
import 'package:learning_flutter_b/navigation/navigation.dart';
import 'package:learning_flutter_b/navigation/profile.dart';
import 'package:learning_flutter_b/navigation/reservations.dart';
import 'package:learning_flutter_b/navigation/top.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
/*
 final dioClient = DioClient(baseUrl: 'https://jsonplaceholder.typicode.com');
  final remoteDataSource = UserRemoteDataSourceImpl(dioClient: dioClient);
  final repository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
  final getUser = GetUser(repository: repository);
  final createUser = CreateUser(repository: repository);
  */
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Navigation(),
        '/login': (context) => const Login(),
        '/register': (context) => const CreateAccount(),
        '/menu': (context) => const Navigation(),
        '/home': (context) => const Home(),
        '/top': (context) => const Top(),
        '/reservations': (context) => const Reservations(),
        '/profile': (context) => const Profile(),
        '/posts': (context) => const Posts(),
        '/tutorial': (context) => const Tutorial(),
      },
    );
  }
}
