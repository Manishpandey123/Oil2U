import 'package:flutter/material.dart';
import 'package:oil2u/presentation/dashboard_page/dashboard_page.dart';
import 'package:oil2u/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:oil2u/presentation/invoices_page_one_screen/invoices_page_one_screen.dart';
import 'package:oil2u/presentation/order_page_two_screen/order_page_two_screen.dart';
import 'package:oil2u/presentation/order_payment/order_payment.dart';
import 'package:oil2u/presentation/order_screen/order_screen.dart';
import 'package:oil2u/presentation/profile_details_screen/profile_details_screen.dart';
import 'package:oil2u/presentation/urgent_delivery_page_one_container_screen/urgent_delivery_page_one_container_screen.dart';
import 'package:oil2u/presentation/urgent_delivery_page_two_screen/urgent_delivery_page_two_screen.dart';
import 'package:oil2u/presentation/urgent_payment/urgent_payment.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/appointment_one_screen/appointment_one_screen.dart';
import '../presentation/appointment_screen/appointment_screen.dart';
import '../presentation/get_started_page_screen/get_started_page_screen.dart';
import '../presentation/invoices_page_three_screen/invoices_page_three_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/maintainence_one_screen/maintainence_one_screen.dart';
import '../presentation/maintainence_screen/maintainence_screen.dart';
import '../presentation/signup_login_screen/signup_login_screen.dart';
import '../presentation/signup_screen/signup_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String getStartedPageScreen = '/get_started_page_screen';

  static const String signupLoginScreen = '/signup_login_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String orderScreen = '/order_screen';
  static const String urgentDeliveryScreen = '/urgent_delivery_screen';
  static const String invoiceScreen = '/invoice_screen';
  static const String maintainenceScreen = '/maintainence_screen';
  static const String appointmentScreen = '/appointment_screen';
  static const String appointmentOneScreen = '/appointment_one_screen';
  static const String maintainenceOneScreen = '/maintainence_one_screen';
  static const String urgentDeliveryPageOneContainerScreen =
      '/urgent_delivery_page_one_container_screen';

  static const String urgentDeliveryPageOnePage =
      '/urgent_delivery_page_one_page';

  static const String urgentDeliveryPageTwoScreen =
      '/urgent_delivery_page_two_screen';

  static const String invoicesPageOneScreen = '/invoices_page_one_screen';

  static const String invoicesPageThreeScreen = '/invoices_page_three_screen';
  static const String orderPageTwoScreen = '/order_page_two_screen';

  static const String profileDetailsScreen = '/profile_details_screen';

  static const String profileHistoryPage = '/profile_history_page';

  static const String profileHistoryTabContainerScreen =
      '/profile_history_tab_container_screen';

  static const String profileInvoicePage = '/profile_invoice_page';

  static const String profileInvoiceContainerScreen =
      '/profile_invoice_container_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String initialRoute = '/initialRoute';
  static const String orderPayment = '/order_payment';
  static const String urgentPayment = '/urgent_payment';

  static Map<String, WidgetBuilder> routes = {
    getStartedPageScreen: (context) => GetStartedPageScreen(),
    signupLoginScreen: (context) => SignupLoginScreen(),
    loginScreen: (context) => LoginScreen(),
    signupScreen: (context) => SignupScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    dashboardPage: (context) => DashboardPage(),
    initialRoute: (context) => GetStartedPageScreen(),
    appointmentScreen: (context) => AppointmentScreen(),
    maintainenceScreen: (context) => MaintenanceScreen(),
    appointmentOneScreen: (context) => AppointmentOneScreen(),
    maintainenceOneScreen: (context) => MaintenanceOneScreen(),
    urgentDeliveryPageOneContainerScreen: (context) =>
        UrgentDeliveryPageOneContainerScreen(),
    urgentDeliveryPageTwoScreen: (context) => UrgentDeliveryPageTwoScreen(),
    invoicesPageOneScreen: (context) => InvoicesPageOneScreen(),
    invoicesPageThreeScreen: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return InvoicesPageThreeScreen(
          invoiceID: int.tryParse(args['invoiceID'].toString())!);
    },
    orderScreen: (context) => OrderScreen(),
    orderPayment: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return OrderPayment(orderID: int.tryParse(args['orderID'].toString())!);
    },
    urgentPayment: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return UrgentPayment(orderID: int.tryParse(args['orderID'].toString())!);
    },

    orderPageTwoScreen: (context) => OrderPageTwoScreen(),
    profileDetailsScreen: (context) => ProfileDetailsScreen(),
    // profileHistoryTabContainerScreen: (context) =>
    //     ProfileHistoryTabContainerScreen(),
    // profileInvoiceContainerScreen: (context) => ProfileInvoiceContainerScreen(),
    editProfileScreen: (context) => EditProfileScreen(),
  };
}
