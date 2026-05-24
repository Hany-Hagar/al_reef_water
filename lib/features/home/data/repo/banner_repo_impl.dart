import 'banner_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/banner_data.dart';
import '../../../../core/failure/failure.dart';

class BannerRepoImpl implements BannerRepo {
  final BannerData bannerData;
  BannerRepoImpl({required this.bannerData});

  @override
  Future<Either<Failure, List<String>>> getBanners() async {
    try {
      final snapshot = await bannerData.fetchBanners();
      final banners = snapshot.docs
          .map((doc) =>
              ((doc.data() as Map<String, dynamic>?)?['image'] ?? '').toString())
          .where((s) => s.isNotEmpty)
          .toList();
      return Right(banners);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}
