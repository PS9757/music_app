import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app/Src/Presentation/Views/Authentication/otp_confirmation.dart';
import 'package:music_app/Src/Presentation/Views/Authentication/signUp.dart';
import 'package:music_app/bottom_navbar.dart';
import 'package:provider/provider.dart';

import 'Src/Presentation/Views/Home/features/recentlyplayed_bloc/recentlyplayed_bloc.dart';
import 'Src/Presentation/Views/Home/features/recomended_bloc/recomended_bloc.dart';
import 'Src/Presentation/Views/Home/features/search_bloc/search_bar_focus_bloc.dart';
import 'Src/utils/music_player/provider/audio_player_provider.dart';
import 'firebase_options.dart';

var box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter().then((value) async {
    await Hive.openBox('myBox').then((value) => box = Hive.box('myBox'));
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AudioPlayerProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RecommendedBloc()),
            BlocProvider(create: (context) => SearchBarFocusBloc()),
            BlocProvider(create: (context) => RecentlyplayedBloc()),
          ],
          child: SignUp(),
        ),
      ),
    );
  }
}






