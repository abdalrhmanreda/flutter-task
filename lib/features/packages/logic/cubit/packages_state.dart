import 'package:flutter_task/features/packages/data/models/package_model.dart';

abstract class PackageState {}

class PackageInitial extends PackageState {}

class PackageLoading extends PackageState {}

class PackageLoaded extends PackageState {
  final List<PackageModel> packages;
  final PackageModel? selectedPackage;

  PackageLoaded({
    required this.packages,
    this.selectedPackage,
  });
}

class PackageError extends PackageState {
  final String message;
  PackageError(this.message);
}

class PackageSelected extends PackageState {
  final PackageModel package;
  PackageSelected(this.package);
}
