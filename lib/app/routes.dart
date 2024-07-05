import 'package:ecom/screens/auth/login_screen.dart';
import 'package:get/get.dart';
import '../features/auth/Bindings/login_binding.dart';
import '../features/auth/Bindings/registration_binding.dart';
import '../features/product/Bindings/products_binding.dart';
import '../screens/auth/register_screen.dart';
import '../screens/product/products_list_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: '/products',
      page: () => ProductListScreen(),
      binding: ProductsListBinding(),
    ),
  ];
}
