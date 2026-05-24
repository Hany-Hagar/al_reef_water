sealed class BannerStates {}

class BannerInitial extends BannerStates {}

class BannerLoading extends BannerStates {}

class BannerSuccess extends BannerStates {}

class BannerFailure extends BannerStates {
  final String errorMessage;

  BannerFailure(this.errorMessage);
}

class BannerIndexUpdated extends BannerStates {}
