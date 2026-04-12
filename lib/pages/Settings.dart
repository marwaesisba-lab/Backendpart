import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedNavIndex = 3;

  static const Color _pageBackground = Color(0xFFF4ECDD);
  static const Color _pillBackground = Color(0xFFF7F7F7);
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
                  children: [
                    const _HeaderSection(),
                    const SizedBox(height: 53),
                    _InfoPill(
                      icon: Icons.edit_outlined,
                      text: 'Edits profile',
                      onTap: () {},
                    ),
                    const SizedBox(height: 30),
                    _InfoPill(
                      icon: Icons.lock_outline_rounded,
                      text: 'Edits password',
                      onTap: () {},
                    ),
                    const SizedBox(height: 30),
                    _InfoPill(
                      icon: Icons.logout_rounded,
                      text: 'Log out',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _BottomNavigationBar(
                selectedNavIndex: _selectedNavIndex,
                onTap: (index) {
                  setState(() {
                    _selectedNavIndex = index;
                  });
                },
              ),
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            size: 24,
            color: Color(0xFF000000),
          ),
          SizedBox(width: 12),
          Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Color(0xFF000000),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _InfoPill({
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 430,
        height: 71,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
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
            Icon(
              icon,
              size: 30,
              color: const Color(0xFF000000),
            ),
            const SizedBox(width: 18),
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
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final int selectedNavIndex;
  final ValueChanged<int> onTap;

  const _BottomNavigationBar({
    required this.selectedNavIndex,
    required this.onTap,
  });

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
                (index) => GestureDetector(
              onTap: () => onTap(index),
              child: Icon(
                icons[index],
                size: 34,
                color: selectedNavIndex == index
                    ? const Color(0xFF000000)
                    : const Color(0xFF000000).withValues(alpha: 0.68),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
