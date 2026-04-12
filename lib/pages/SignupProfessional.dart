import 'package:flutter/material.dart';

class Professional1 extends StatefulWidget {
  const Professional1({super.key});

  @override
  State<Professional1> createState() => _Professional1State();
}

class _Professional1State extends State<Professional1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _familyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _familyNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _jobFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  bool _obscurePassword = true;
  bool _hasSubmitted = false;

  @override
  void initState() {
    super.initState();

    final nodes = [
      _firstNameFocus,
      _familyNameFocus,
      _emailFocus,
      _passwordFocus,
      _addressFocus,
      _jobFocus,
      _phoneFocus,
    ];

    for (final node in nodes) {
      node.addListener(() {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _familyNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _jobController.dispose();
    _phoneController.dispose();

    _firstNameFocus.dispose();
    _familyNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _addressFocus.dispose();
    _jobFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  String? _validateName(String? value, String fieldName) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return '$fieldName is required';
    if (text.length < 2) return '$fieldName must be at least 2 characters';
    return null;
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Email is required';

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(text)) return 'Enter a valid email address';
    return null;
  }

  String? _validatePassword(String? value) {
    final text = value ?? '';
    if (text.isEmpty) return 'Password is required';
    if (text.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(text)) {
      return 'Password must contain at least 1 uppercase letter';
    }
    if (!RegExp(r'\d').hasMatch(text)) {
      return 'Password must contain at least 1 number';
    }
    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    if ((value?.trim() ?? '').isEmpty) return '$fieldName is required';
    return null;
  }

  String? _validatePhone(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^\d+$').hasMatch(text)) {
      return 'Phone number must contain numbers only';
    }
    if (text.length < 9 || text.length > 15) {
      return 'Phone number must be 9 to 15 digits';
    }
    return null;
  }

  InputDecoration _inputDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Color(0xFF968A8A),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
      errorStyle: const TextStyle(
        height: 0,
        color: Colors.transparent,
        fontSize: 0,
      ),
    );
  }

  Widget _buildFieldContainer({
    required Widget child,
    required bool isFocused,
    required bool hasError,
  }) {
    final backgroundColor = hasError
        ? const Color(0xFFF7B7BE)
        : isFocused
        ? const Color(0xFFC8D9FF)
        : const Color(0xFFFBF7F2);

    final borderColor = hasError
        ? const Color(0xFFE07B85)
        : isFocused
        ? const Color(0xFF7FA7FF)
        : Colors.transparent;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: borderColor,
          width: hasError || isFocused ? 1.4 : 0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required String? Function(String?) validator,
    required Widget prefixIcon,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    TextInputAction? textInputAction,
    FocusNode? nextFocus,
  }) {
    final errorText = _hasSubmitted ? validator(controller.text) : null;
    final hasError = errorText != null;
    final isFocused = focusNode.hasFocus;

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldContainer(
            isFocused: isFocused,
            hasError: hasError,
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              validator: validator,
              keyboardType: keyboardType,
              obscureText: obscureText,
              textInputAction: textInputAction,
              scrollPadding: const EdgeInsets.only(bottom: 140),
              onChanged: (_) {
                if (_hasSubmitted) {
                  setState(() {});
                  _formKey.currentState?.validate();
                }
              },
              onFieldSubmitted: (_) {
                if (nextFocus != null) {
                  FocusScope.of(context).requestFocus(nextFocus);
                } else {
                  FocusScope.of(context).unfocus();
                }
              },
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              decoration: _inputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
          if (hasError)
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 8),
              child: Text(
                errorText,
                style: const TextStyle(
                  color: Color(0xFFD94C57),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _submitForm() {
    FocusScope.of(context).unfocus();

    setState(() {
      _hasSubmitted = true;
    });

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign up successful!'),
          backgroundColor: Color(0xFF4A4A4A),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF4ECDD),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(bottom: bottomInset),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Form(
                  key: _formKey,
                  autovalidateMode: _hasSubmitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/homelogo.png',
                            height: 51,
                            width: 51,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'AT Your\nDoor',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          letterSpacing: -1.0,
                        ),
                      ),
                      const Text(
                        'Login to continue using the service',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 156,
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B2B2B),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Professional',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                      _buildField(
                        controller: _firstNameController,
                        focusNode: _firstNameFocus,
                        hintText: 'ENTER YOUR NAME',
                        validator: (value) => _validateName(value, 'First name'),
                        textInputAction: TextInputAction.next,
                        nextFocus: _familyNameFocus,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/user.png',
                            width: 36,
                            height: 31,
                          ),
                        ),
                      ),
                      _buildField(
                        controller: _familyNameController,
                        focusNode: _familyNameFocus,
                        hintText: 'ENTER YOUR FAMILY NAME',
                        validator: (value) =>
                            _validateName(value, 'Family name'),
                        textInputAction: TextInputAction.next,
                        nextFocus: _emailFocus,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/user.png',
                            width: 36,
                            height: 31,
                          ),
                        ),
                      ),
                      _buildField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        hintText: 'ENTER YOUR EMAIL',
                        validator: _validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        nextFocus: _passwordFocus,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xFF968A8A),
                          size: 24,
                        ),
                      ),
                      _buildField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        hintText: 'ENTER YOUR PASSWORD',
                        validator: _validatePassword,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        nextFocus: _addressFocus,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFF968A8A),
                          size: 24,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xFF968A8A),
                          ),
                        ),
                      ),
                      _buildField(
                        controller: _addressController,
                        focusNode: _addressFocus,
                        hintText: 'ENTER YOUR ADDRESS',
                        validator: (value) =>
                            _validateRequired(value, 'Address'),
                        textInputAction: TextInputAction.next,
                        nextFocus: _jobFocus,
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: Color(0xFF968A8A),
                          size: 24,
                        ),
                      ),
                      _buildField(
                        controller: _jobController,
                        focusNode: _jobFocus,
                        hintText: 'ENTER YOUR JOB',
                        validator: (value) => _validateRequired(value, 'Job'),
                        textInputAction: TextInputAction.next,
                        nextFocus: _phoneFocus,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              'assets/job.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      _buildField(
                        controller: _phoneController,
                        focusNode: _phoneFocus,
                        hintText: 'ENTER YOUR PHONE NUMBER',
                        validator: _validatePhone,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color(0xFF968A8A),
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A4A4A),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 120,
                            vertical: 15,
                          ),
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}