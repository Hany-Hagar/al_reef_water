import 'generated/l10n.dart';
import 'firebase_options.dart';
import 'core/utils/theme.dart';
import 'core/di/server_locator.dart';
import 'package:flutter/material.dart';
import 'core/utils/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'features/layout/manager/layout_cubit.dart';
import 'features/splash/pages/views/splash_view.dart';
import 'features/settings/data/models/app_user_pref.dart';
import 'features/cart/presentation/manager/cart_cubit.dart';
import 'features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/home/presentation/manager/banner_cubit.dart';
import 'features/home/presentation/manager/product_cubit.dart';
import 'features/orders/presentation/manager/orders_cubit.dart';
import 'features/favourites/presentation/manager/fav_cubit.dart';
import 'features/profile/presentation/manager/profile_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/settings/presentation/manager/settings_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Auth
        BlocProvider(create: (context) => getIt<AuthCubit>()),

        // Layout
        BlocProvider(create: (context) => getIt<LayoutCubit>()),

        // Home
        BlocProvider(create: (context) => getIt<ProductCubit>()),
        BlocProvider(create: (context) => getIt<BannerCubit>()),

        // Favourites
        BlocProvider(create: (context) => getIt<FavCubit>()),

        // Cart
        BlocProvider(create: (context) => getIt<CartCubit>()),

        // Settings
        BlocProvider(create: (context) => getIt<SettingsCubit>()),

        // Orders
        BlocProvider(create: (context) => getIt<OrdersCubit>()),

        // Profile
        BlocProvider(create: (context) => getIt<ProfileCubit>()), 
      ],
      child: BlocBuilder<SettingsCubit, AppUserPref>(
        builder: (context, state) => ScreenUtilInit(
          designSize: const Size(390, 884),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              themeMode: state.theme,
              theme: AppTheme.light,
              title: 'Al Reef Water',
              darkTheme: AppTheme.dark,
              locale: Locale(state.lang),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: const SplashView(),
            );
          },
        ),
      ),
    );
  }
}
