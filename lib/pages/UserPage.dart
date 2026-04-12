import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedNavIndex = 1;

  final List<_UserItem> _allUsers = [
    const _UserItem(
      name: 'Karim yahiaoui',
      role: 'Professional',
      avatarPath: 'assets/karim.jpg',
    ),
    const _UserItem(
      name: 'Sarah mohamdi',
      role: 'Customer',
      avatarPath: 'assets/user.png',
    ),
    const _UserItem(
      name: 'Islam benali',
      role: 'Professional',
      avatarPath: 'assets/islam.png',
    ),
    const _UserItem(
      name: 'User user',
      role: 'Customer',
      avatarPath: 'assets/user.png',
    ),
    const _UserItem(
      name: 'Morad mahiou',
      role: 'Professional',
      avatarPath: 'assets/mourad.png',
    ),
  ];

  String get _query => _searchController.text.trim().toLowerCase();

  List<_UserItem> get _filteredUsers {
    if (_query.isEmpty) return _allUsers;
    return _allUsers
        .where(
          (user) =>
      user.name.toLowerCase().contains(_query) ||
          user.role.toLowerCase().contains(_query),
    )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 18, 20, 12),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
            color: Colors.black,
          ),
          Expanded(
            child: Center(
              child: Text(
                'Users',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Color(0xFFFBF7F2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (_) => setState(() {}),
        decoration: const InputDecoration(
          hintText: 'Search users...',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFFBCBCBC),
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 28,
            color: Colors.black54,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildAvatar(String path) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE9E9E9),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
          onError: (_, __) {},
        ),
      ),
    );
  }

  Widget _buildActionButton(_UserItem user) {
    final isProfessional = user.role == 'Professional';
    final backgroundColor = isProfessional
        ? const Color(0xFF5BC8B7)
        : const Color(0xFFC95A57);
    final label = isProfessional ? 'Activate' : 'Delete';

    return Container(
      width: 92,
      height: 38,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(19),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildUserCard(_UserItem user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          _buildAvatar(user.avatarPath),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.role,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8C8C8C),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _buildActionButton(user),
        ],
      ),
    );
  }

  Widget _buildUsersContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: _filteredUsers.map(_buildUserCard).toList(),
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      Icons.home_outlined,
      Icons.person,
      Icons.engineering_outlined,
      Icons.description_outlined,
    ];

    return Container(
      height: 94,
      color: const Color(0xFFEFEFEF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          final selected = _selectedNavIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedNavIndex = index;
              });
            },
            child: Icon(
              items[index],
              size: 34,
              color: selected ? Colors.black : Colors.black87,
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E0),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                    child: Column(
                      children: [
                        _buildHeader(),
                        _buildSearchBar(),
                        const SizedBox(height: 18),
                        _buildUsersContainer(),
                      ],
                    ),
                  ),
                ),
                _buildBottomNav(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserItem {
  final String name;
  final String role;
  final String avatarPath;

  const _UserItem({
    required this.name,
    required this.role,
    required this.avatarPath,
  });
}
