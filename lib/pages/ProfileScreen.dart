import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color _pageBackground = Color(0xFFF4ECDD);
  static const Color _pillBackground = Color(0xFFD9D9D9);
  static const Color _textColor = Color(0xFF000000);
  static const Color _bottomBarColor = Color(0xFFEAEAEA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  0,
                  69,
                  0,
                  129 + MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  children: const [
                    _HeaderSection(),
                    SizedBox(height: 53),
                    _InfoPill(
                      customImage: 'assets/user.png',
                      text: 'KARIM BEN',
                    ),
                    SizedBox(height: 30),
                    _InfoPill(
                      icon: Icons.mail_outline_rounded,
                      text: 'karimelec@gmail.com',
                    ),
                    SizedBox(height: 30),
                    _InfoPill(
                      icon: Icons.phone_outlined,
                      text: '+213780103306',
                    ),
                    SizedBox(height: 30),
                    _InfoPill(
                      icon: Icons.location_on_outlined,
                      text: 'Algeria',
                    ),
                    SizedBox(height: 30),
                    _InfoPill(
                      icon: Icons.work_outline_rounded,
                      text: 'ELECTRECIAN',
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _BottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: SizedBox(
            width: 105,
            height: 105,
            child: Image.asset(
              'assets/user.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: const Color(0xFFD9D9D9),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'KARIM ELC',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF000000),
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData? icon;
  final String? customImage;
  final String text;

  const _InfoPill({
    this.icon,
    this.customImage,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 71,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 38,
            height: 38,
            child: customImage != null
                ? Image.asset(
              customImage!,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFCFCFCF),
                  ),
                );
              },
            )
                : Icon(
              icon,
              size: 30,
              color: const Color(0xFF000000),
            ),
          ),
          const SizedBox(width:18),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF000000),
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home_outlined,
      Icons.search_rounded,
      Icons.add_box_outlined,
      Icons.account_circle_outlined,
    ];

    return Container(
      height: 105,
      color: const Color(0xFFEAEAEA),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
                (index) => Icon(
              icons[index],
              size: 34,
              color: const Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}
