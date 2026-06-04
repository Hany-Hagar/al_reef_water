sealed class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoading extends ProductStates {}

class ProductSuccess extends ProductStates {}

class ProductFailure extends ProductStates {
  final String errorMessage;

  ProductFailure(this.errorMessage);
}
