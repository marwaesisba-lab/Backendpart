import 'package:flutter/material.dart';

class ProfessionalsPage extends StatefulWidget {
  const ProfessionalsPage({super.key});

  @override
  State<ProfessionalsPage> createState() => _ProfessionalsPageState();
}

class _ProfessionalsPageState extends State<ProfessionalsPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedNavIndex = 2;

  final List<_ProfessionalItem> _allProfessionals = const [
    _ProfessionalItem(
      name: 'Karim yhiaaoui',
      job: 'Plumber',
      totalBook: 120,
      rating: 4.9,
      avatarPath: 'assets/karim.jpg',
    ),
    _ProfessionalItem(
      name: 'Islam benali',
      job: 'Electricien',
      totalBook: 140,
      rating: 5.0,
      avatarPath: 'assets/islam.png',
    ),
    _ProfessionalItem(
      name: 'Morad mahiou',
      job: 'plumber',
      totalBook: 99,
      rating: 4.0,
      avatarPath: 'assets/mourad.png',
    ),
    _ProfessionalItem(
      name: 'sarah benzamouri',
      job: 'Cleaner',
      totalBook: 50,
      rating: 2.0,
      avatarPath: 'assets/sarah.png',
    ),
    _ProfessionalItem(
      name: 'Omar ned',
      job: 'Electricien',
      totalBook: 50,
      rating: 2.0,
      avatarPath: 'assets/islam.png',
    ),
  ];

  List<_ProfessionalItem> get _filteredProfessionals {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return _allProfessionals;
    return _allProfessionals.where((item) {
      return item.name.toLowerCase().contains(query) ||
          item.job.toLowerCase().contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildBackButton() {
    return Container(
      width: 29,
      height: 29,
      alignment: Alignment.center,
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 20,
        color: Colors.black,
      ),
    );
  }

  Widget _buildHeader() {
    return const Expanded(
      child: Center(
        child: Text(
          'Professionnels',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (_) => setState(() {}),
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 27,
            color: Color(0xFFBEB7AE),
          ),
          hintText: 'Search professionnel ...',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFFC3BCB3),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildAvatar(String path) {
    return Container(
      width: 61,
      height: 61,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE6E6E6),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
          onError: (_, __) {},
        ),
      ),
    );
  }

  Widget _buildRating(_ProfessionalItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star_rounded,
          color: Color(0xFFFFC107),
          size: 23,
        ),
        const SizedBox(width: 2),
        Text(
          item.rating % 1 == 0 ? item.rating.toInt().toString() : item.rating.toString(),
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildApproveButton() {
    return Container(
      width: 91,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFF5CC8B7),
        borderRadius: BorderRadius.circular(19),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Approved',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildProfessionalCard(_ProfessionalItem item) {
    return Container(
      width: 367,
     // height: 96,
      decoration: BoxDecoration(
        color: const Color(0xFFF4ECDD),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildAvatar(item.avatarPath),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.job,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8A8378),
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${item.totalBook}Total bock',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5F5A53),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRating(item),
              const SizedBox(height: 10),
              _buildApproveButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(19, 18, 19, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (int i = 0; i < _filteredProfessionals.length; i++) ...[
            _buildProfessionalCard(_filteredProfessionals[i]),
            if (i != _filteredProfessionals.length - 1) const SizedBox(height: 17),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    final icons = [
      Icons.home_outlined,
      Icons.person_outline_rounded,
      Icons.engineering_rounded,
      Icons.description_outlined,
    ];

    return Container(
      height: 105,
      color: const Color(0xFFECECEC),
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
                size: 34,
                color: isActive ? Colors.black : Colors.black.withOpacity( 0.68),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4ECDD),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(23, 33, 24, 28),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _buildBackButton(),
                        _buildHeader(),
                        const SizedBox(width: 29),
                      ],
                    ),
                    const SizedBox(height: 21),
                    _buildSearchBar(),
                    const SizedBox(height: 28),
                    _buildListContainer(),
                  ],
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }
}

class _ProfessionalItem {
  final String name;
  final String job;
  final int totalBook;
  final double rating;
  final String avatarPath;

  const _ProfessionalItem({
    required this.name,
    required this.job,
    required this.totalBook,
    required this.rating,
    required this.avatarPath,
  });
}
