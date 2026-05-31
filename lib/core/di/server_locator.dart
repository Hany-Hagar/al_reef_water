import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/home/data/repo/banner_repo.dart';
import '../../features/home/data/repo/product_repo.dart';
import '../../features/layout/manager/layout_cubit.dart';
import '../../features/orders/data/repo/orders_repo.dart';
import '../../features/cart/data/database/cart_data.dart';
import '../../features/auth/data/database/auth_data.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/favourites/data/repo/fav_repo.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/home/data/database/banner_data.dart';
import '../../features/home/data/repo/banner_repo_impl.dart';
import '../../features/home/data/database/product_data.dart';
import '../../features/home/data/repo/product_repo_impl.dart';
import '../../features/orders/data/database/orders_data.dart';
import '../../features/orders/data/repo/orders_repo_impl.dart';
import '../../features/favourites/data/database/fav_data.dart';
import '../../features/profile/data/database/profile_data.dart';
import '../../features/favourites/data/repo/fav_repo_impl.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/auth/presentation/manager/auth_cubit.dart';
import '../../features/cart/presentation/manager/cart_cubit.dart';
import '../../features/home/presentation/manager/banner_cubit.dart';
import '../../features/home/presentation/manager/product_cubit.dart';
import '../../features/orders/presentation/manager/orders_cubit.dart';
import '../../features/favourites/presentation/manager/fav_cubit.dart';
import '../../features/profile/presentation/manager/profile_cubit.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());

  // Layout
  getIt.registerLazySingleton<LayoutCubit>(() => LayoutCubit());

  // Auth
  getIt.registerLazySingleton<AuthData>(() => AuthData());
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authData: getIt<AuthData>()));
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(authRepo: getIt<AuthRepo>()));

  // Home
  getIt.registerLazySingleton<ProductData>(() => ProductData());
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(productData: getIt<ProductData>()));
  getIt.registerLazySingleton<ProductCubit>(() => ProductCubit(productRepo: getIt<ProductRepo>()));

  // Banner
  getIt.registerLazySingleton<BannerData>(() => BannerData());
  getIt.registerLazySingleton<BannerRepo>(() => BannerRepoImpl(bannerData: getIt<BannerData>()));
  getIt.registerLazySingleton<BannerCubit>(() => BannerCubit(bannerRepo: getIt<BannerRepo>()));

  // Fav
  getIt.registerLazySingleton<FavData>(() => FavData());
  getIt.registerLazySingleton<FavRepo>(() => FavRepoImpl(favData: getIt<FavData>()));
  getIt.registerLazySingleton<FavCubit>(() => FavCubit(favRepo: getIt<FavRepo>()));

  // Cart
  getIt.registerLazySingleton<CartData>(() => CartData());
  getIt.registerLazySingleton<CartRepo>(() => CartRepoImpl(cartData: getIt<CartData>()));
  getIt.registerLazySingleton<CartCubit>(() => CartCubit(cartRepo: getIt<CartRepo>()));


  // Profile
  getIt.registerLazySingleton<ProfileData>(() => ProfileData());
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(profileData: getIt<ProfileData>()));
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(profileRepo: getIt<ProfileRepo>()));

  // Orders
  getIt.registerLazySingleton<OrdersData>(() => OrdersData());
  getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepoImpl(ordersData: getIt<OrdersData>()));
  getIt.registerLazySingleton<OrdersCubit>(() => OrdersCubit(ordersRepo: getIt<OrdersRepo>()));

}
