import 'package:flutter/material.dart';

class PlumberPage extends StatefulWidget {
  const PlumberPage({super.key});

  @override
  State<PlumberPage> createState() => _PlumberPageState();
}

class _PlumberPageState extends State<PlumberPage> {
  int _selectedNavIndex = 1;

  final List<_ProfessionalItem> _professionals = const [
    _ProfessionalItem(
      name: 'MOHAMED PLB',
      location: 'TELEMCEN',
      rating: 4.0,
      imagePath: 'assets/karim.jpg',
    ),
    _ProfessionalItem(
      name: 'MORAD PLB',
      location: 'SKIKDA',
      rating: 3.0,
      imagePath: 'assets/moradplb.png',
    ),
    _ProfessionalItem(
      name: 'ISLAM PLB',
      location: 'TIPAZA',
      rating: 3.2,
      imagePath: 'assets/islamplb.png',
    ),
    _ProfessionalItem(
      name: 'OMAR PLB',
      location: 'ANNABA',
      rating: 2.0,
      imagePath: 'assets/omar.jpg',
    ),
  ];

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).maybePop();
      },
      child: SizedBox(
        width: 29,
        height: 29,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildBackButton(context),
            const Expanded(
              child: Center(
                child: Text(
                  'Plumber',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 29),
          ],
        ),
        const SizedBox(height: 26),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Plumbers nearby',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(String path) {
    return Container(
      width: 74,
      height: 74,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE7E7E7),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
          onError: (_, __) {},
        ),
      ),
    );
  }

  Widget _buildRating(double rating) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          size: 20,
          color: Color(0xFFFFC107),
        ),
        const SizedBox(width: 4),
        Text(
          rating % 1 == 0 ? rating.toInt().toString() : rating.toString(),
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildBookButton() {
    return Container(
      width: 86,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF4A4A4A),
        borderRadius: BorderRadius.circular(17),
      ),
      alignment: Alignment.center,
      child: const Text(
        'BOOK',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildProfessionalCard(_ProfessionalItem item) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4ECDD),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileImage(item.imagePath),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        item.location,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildRating(item.rating),
                const SizedBox(height: 14),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildBookButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    final icons = [
      Icons.home_outlined,
      Icons.search_rounded,
      Icons.add_box_outlined,
      Icons.account_circle_outlined,
    ];

    return Container(
      height: 105,
      color: const Color(0xFFECECEC),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
                (index) {
              final isActive = index == _selectedNavIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedNavIndex = index;
                  });
                },
                child: Icon(
                  icons[index],
                  size: index == 1 ? 38 : 34,
                  color: isActive
                      ? Colors.black
                      : Colors.black.withValues(alpha: 0.68),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context) {
    final bottomNavHeight = 105 + MediaQuery.of(context).padding.bottom;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        23,
        33,
        24,
        bottomNavHeight + 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          for (int i = 0; i < _professionals.length; i++) ...[
            _buildProfessionalCard(_professionals[i]),
            if (i != _professionals.length - 1) const SizedBox(height: 18),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: _buildScrollableContent(context),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildBottomNavigation(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfessionalItem {
  final String name;
  final String location;
  final double rating;
  final String imagePath;

  const _ProfessionalItem({
    required this.name,
    required this.location,
    required this.rating,
    required this.imagePath,
  });
}
