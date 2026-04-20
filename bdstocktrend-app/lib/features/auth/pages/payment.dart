// ignore_for_file: deprecated_member_use

import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/general/pages/main/cubit/main_cubit.dart';
import 'package:bd_stock_trend/utils/services/hive/main_box.dart';
import 'package:bd_stock_trend/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sslcommerz/model/SSLCAdditionalInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart' as ftoast;
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

enum SdkType { LIVE, TESTBOX }

class Payment extends StatefulWidget {
  @override
  _Payment createState() => _Payment();
}

class _Payment extends State<Payment> with MainBoxMixin {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Controllers for form inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _currentAddressController =
      TextEditingController();
  final TextEditingController _permanentAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();

  // Subscription months selection
  String? _selectedSubscription = '1';

  bool _isFormValid = false;

  // SSLCommerz credentials from environment variables for production
  // IMPORTANT: Replace the default values with your ACTUAL LIVE credentials from SSLCommerz Merchant Panel
  static const String storeId = String.fromEnvironment(
    "SSLCOMMERZ_STORE_ID",
    defaultValue:
        "bdstocktrendlive", // TODO: Replace with your actual live store ID
  );
  static const String storePassword = String.fromEnvironment(
    "SSLCOMMERZ_STORE_PASSWORD",
    defaultValue:
        "bdstocktrendlive@ssl", // TODO: Replace with your actual live password
  );

  // Production backend URL for IPN callback
  // This MUST be a publicly accessible HTTPS URL for SSLCommerz to send IPN notifications
  String baseUrl = const String.fromEnvironment(
    "BASE_URL",
    defaultValue:
        "https://bdstocktrend-backend-arnabdey665-dev.apps.rm2.thpm.p1.openshiftapps.com",
  );

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MainCubit>().updateTitle('Payment');
    });
  }

  // Function to validate form and update the button state
  void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  // Form submit handler
  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Proceed with form submission logic
      payNow();
      print('Form is valid. Proceeding with payment.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 22, 21, 21),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              SpacerV(value: 24),
              _buildPaymentForm(),
              SpacerV(value: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Icon(Icons.payment_rounded, size: 48, color: Palette.primary),
        SpacerV(value: 12),
        Text(
          "Premium Subscription",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        SpacerV(value: 8),
        Text(
          "Unlock exclusive features with our premium plans",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }

  Widget _buildPaymentForm() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radiusLarge),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          onChanged: _validateForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Billing Details",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SpacerV(value: 24),
              _buildTextField(
                controller: _nameController,
                label: 'Full Name',
                icon: Icons.person_outline,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SpacerV(value: 16),
              _buildTextField(
                controller: _emailController,
                label: 'Email Address',
                icon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SpacerV(value: 16),
              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                icon: Icons.phone_outlined,
                inputType: TextInputType.phone,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SpacerV(value: 16),
              _buildTextField(
                controller: _currentAddressController,
                label: 'Current Address',
                icon: Icons.home_outlined,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SpacerV(value: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _cityController,
                      label: 'City',
                      icon: Icons.location_city_outlined,
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  SpacerH(value: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _postCodeController,
                      label: 'Post Code',
                      icon: Icons.local_post_office_outlined,
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              SpacerV(value: 16),
              _buildTextField(
                controller: _permanentAddressController,
                label: 'Permanent Address',
                icon: Icons.location_on_outlined,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SpacerV(value: 16),
              _buildTextField(
                controller: _stateController,
                label: 'State/Division',
                icon: Icons.map_outlined,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SpacerV(value: 16),
              DropdownButtonFormField<String>(
                value: _selectedSubscription,
                decoration: InputDecoration(
                  labelText: 'Subscription Plan',
                  prefixIcon: const Icon(Icons.subscriptions_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.radiusSmall),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                      value: '1', child: Text('1 Month - 100 BDT')),
                  DropdownMenuItem(
                      value: '3', child: Text('3 Months - 300 BDT')),
                  DropdownMenuItem(
                      value: '12', child: Text('1 Year - 1200 BDT')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedSubscription = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a plan' : null,
              ),
              SpacerV(value: 32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.goNamed(Routes.dashboard.name),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.radiusSmall),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  SpacerH(value: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isFormValid ? _onSubmit : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.radiusSmall),
                        ),
                      ),
                      child: const Text('Pay Now'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 126, 172, 236)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusSmall),
          borderSide: BorderSide(color: const Color.fromARGB(255, 24, 24, 24)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusSmall),
          borderSide: BorderSide(color: const Color.fromARGB(255, 24, 24, 24)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusSmall),
          borderSide: BorderSide(color: Palette.primary),
        ),
        filled: true,
        fillColor: Colors.black,
      ),
    );
  }

  Future<void> payNow() async {
    Sslcommerz sslcommerz = Sslcommerz(
            initializer: SSLCommerzInitialization(
                ipn_url: '$baseUrl/payment/listener/ipn',
                currency: SSLCurrencyType.BDT,
                product_category: "Subscription",
                // PRODUCTION MODE: SSLCSdkType.LIVE enables real payments (bKash, Nagad, Card, Bank)
                sdkType: SSLCSdkType.LIVE,
                store_id: storeId,
                store_passwd: storePassword,
                total_amount: 100.00 * double.parse(_selectedSubscription!),
                tran_id: const Uuid().v4()))
        .addAdditionalInitializer(
      sslcAdditionalInitializer: SSLCAdditionalInitializer(
        valueA: _selectedSubscription,
        valueB: getData(MainBoxKeys.token),
      ),
    );

    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      if (result is PlatformException) {
        debugPrint(result.status);
      } else {
        if (result.status!.toLowerCase() == "failed") {
          print('Transaction is Failed....');
          await ftoast.Fluttertoast.showToast(
              msg: "Transaction is Failed....",
              toastLength: ftoast.Toast.LENGTH_SHORT,
              gravity: ftoast.ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          addData(MainBoxKeys.roles, ['ROLE_PREMIUM_USER']);

          context.goNamed(Routes.dashboard.name);

          print(
              "Transaction is ${result.status} and Amount is ${result.amount}");
          await ftoast.Fluttertoast.showToast(
            msg:
                "Transaction is ${result.status} and Amount is ${result.amount}",
            toastLength: ftoast.Toast.LENGTH_SHORT,
            gravity: ftoast.ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
