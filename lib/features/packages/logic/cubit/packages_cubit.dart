import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/cache/sql_helper.dart';
import 'package:flutter_task/features/packages/data/models/package_model.dart';
import 'package:flutter_task/features/packages/logic/cubit/packages_state.dart';

class PackageCubit extends Cubit<PackageState> {
  final SqlHelper sqlHelper;
  static const String tableName = 'packages';

  List<PackageModel> packages = [];
  PackageModel? selectedPackage;

  PackageCubit(this.sqlHelper) : super(PackageInitial());

  // Initialize packages - load from database or insert defaults
  Future<void> initializePackages() async {
    try {
      emit(PackageLoading());

      // Get existing packages from database
      final data = await sqlHelper.getData(tableName: tableName);

      if (data.isEmpty) {
        // Insert default packages if database is empty
        await _insertDefaultPackages();
        final newData = await sqlHelper.getData(tableName: tableName);
        packages = newData.map((map) => PackageModel.fromMap(map)).toList();
      } else {
        packages = data.map((map) => PackageModel.fromMap(map)).toList();
      }

      // Get selected package (the one with selectedAt not null)
      selectedPackage = packages.firstWhere(
        (p) => p.selectedAt != null,
        orElse: () => packages.first,
      );

      // If no package was selected, set selectedPackage to null
      if (selectedPackage?.selectedAt == null) {
        selectedPackage = null;
      }

      emit(PackageLoaded(packages: packages, selectedPackage: selectedPackage));
    } catch (e) {
      emit(PackageError('فشل تحميل الباقات: $e'));
    }
  }

  // Select a package and save to database
  Future<void> selectPackage(String packageName) async {
    try {
      // Find the package
      final package = packages.firstWhere((p) => p.name == packageName);

      // Clear all previous selections
      for (var p in packages) {
        if (p.selectedAt != null) {
          await sqlHelper.updateData(
            tableName: tableName,
            data: {'selectedAt': null},
            id: p.id.toString(),
          );
        }
      }

      // Update selected package
      await sqlHelper.updateData(
        tableName: tableName,
        data: {'selectedAt': DateTime.now().toIso8601String()},
        id: package.id.toString(),
      );

      selectedPackage = package.copyWith(selectedAt: DateTime.now());
      emit(PackageLoaded(packages: packages, selectedPackage: selectedPackage));
    } catch (e) {
      emit(PackageError('فشل اختيار الباقة: $e'));
    }
  }

  // Clear package selection
  Future<void> clearSelection() async {
    try {
      if (selectedPackage != null) {
        await sqlHelper.updateData(
          tableName: tableName,
          data: {'selectedAt': null},
          id: selectedPackage!.id.toString(),
        );
      }

      selectedPackage = null;
      emit(PackageLoaded(packages: packages, selectedPackage: null));
    } catch (e) {
      emit(PackageError('فشل إلغاء الاختيار: $e'));
    }
  }

  // Get currently selected package
  PackageModel? getSelectedPackage() {
    return selectedPackage;
  }

  // Insert default packages into database
  Future<void> _insertDefaultPackages() async {
    final defaultPackages = _getDefaultPackages();

    for (var package in defaultPackages) {
      await sqlHelper.insertData(tableName: tableName, data: package.toMap());
    }
  }

  // Get list of default packages (hardcoded data)
  List<PackageModel> _getDefaultPackages() {
    return [
      PackageModel(
        name: 'اساسية',
        price: '23,000',
        featuresCount: 0,
        features: ['صلاحية الاعلان 30 يوم'],
      ),
      PackageModel(
        name: 'اقتصادى',
        price: '23,000',
        featuresCount: 7,
        showBadge: true,
        badgeText: 'افضل قيمة مقابل سعر',
        features: [
          'صلاحية الاعلان 30 يوم',
          'رفع الاعلى القائمة كل 3 أيام',
          'تثبيت فى مقاول صحى\n( خلال الـ48 ساعة القادمة )',
        ],
      ),
      PackageModel(
        name: 'بلس',
        price: '23,000',
        featuresCount: 18,
        showMoreFeatures: true,
        features: [
          'صلاحية الاعلان 30 يوم',
          'رفع الاعلى القائمة كل 2 يوم',
          'تثبيت فى مقاول صحى\n( خلال الـ48 ساعة القادمة )',
          'ظهور فى كل محافظات مصر',
          'اعلى مميز',
          'تثبيت فى مقاول صحى فى الجهراء',
          'تثبيت فى مقاول صحى\n( خلال الـ48 ساعة القادمة )',
        ],
      ),
      PackageModel(
        name: 'سوبر',
        price: '23,000',
        featuresCount: 24,
        features: [
          'صلاحية الاعلان 30 يوم',
          'رفع الاعلى القائمة كل 2 يوم',
          'تثبيت فى مقاول صحى\n( خلال الـ48 ساعة القادمة )',
          'ظهور فى كل محافظات مصر',
          'اعلى مميز',
          'تثبيت فى مقاول صحى فى الجهراء',
          'تثبيت فى مقاول صحى\n( خلال الـ48 ساعة القادمة )',
        ],
      ),
    ];
  }
}
