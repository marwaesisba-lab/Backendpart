import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedNavIndex = 3;

  final List<_ReportItem> _allReports = const [
    _ReportItem(
      name: 'Sarah sid',
      issue: 'Late arrival',
    ),
    _ReportItem(
      name: 'KARIM ben',
      issue: 'Poor service',
    ),
    _ReportItem(
      name: 'Sarah sid',
      issue: 'Overcharge',
    ),
    _ReportItem(
      name: 'KARIM ben',
      issue: 'No show',
    ),
  ];

  List<_ReportItem> get _filteredReports {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return _allReports;
    return _allReports.where((report) {
      return report.name.toLowerCase().contains(query) ||
          report.issue.toLowerCase().contains(query);
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

  Widget _buildHeaderTitle() {
    return const Expanded(
      child: Center(
        child: Text(
          'Reports',
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
          hintText: 'Search...',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFFBCBCBC),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildViewButton() {
    return Container(
      width: 103,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFF4A4A4A),
        borderRadius: BorderRadius.circular(19),
      ),
      alignment: Alignment.center,
      child: const Text(
        'View details',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildReportCard(_ReportItem item) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.issue,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFA43333),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _buildViewButton(),
        ],
      ),
    );
  }

  Widget _buildReportsContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (int i = 0; i < _filteredReports.length; i++) ...[
            _buildReportCard(_filteredReports[i]),
            if (i != _filteredReports.length - 1) const SizedBox(height: 18),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    final icons = [
      Icons.home_outlined,
      Icons.person_outline_rounded,
      Icons.engineering_outlined,
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
                color: isActive
                    ? Colors.black
                    : Colors.black.withValues(alpha: 0.68),
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
                        _buildHeaderTitle(),
                        const SizedBox(width: 29),
                      ],
                    ),
                    const SizedBox(height: 21),
                    _buildSearchBar(),
                    const SizedBox(height: 28),
                    _buildReportsContainer(),
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

class _ReportItem {
  final String name;
  final String issue;

  const _ReportItem({
    required this.name,
    required this.issue,
  });
}
