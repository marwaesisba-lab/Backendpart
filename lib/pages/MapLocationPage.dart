import 'package:flutter/material.dart';

class MapLocationPage extends StatefulWidget {
  const MapLocationPage({super.key});

  @override
  State<MapLocationPage> createState() => _MapLocationPageState();
}

class _MapLocationPageState extends State<MapLocationPage> {
  Offset _pinPosition = const Offset(0.5, 0.45);
  String _selectedAddress = 'Alger';

  void _onMapTap(TapUpDetails details, BoxConstraints constraints) {
    final dx = (details.localPosition.dx / constraints.maxWidth).clamp(0.08, 0.92);
    final dy = (details.localPosition.dy / constraints.maxHeight).clamp(0.12, 0.88);

    setState(() {
      _pinPosition = Offset(dx, dy);
      _selectedAddress = 'Selected location';
    });
  }

  Widget _buildHeader() {
    return Container(
      height: 88,
      decoration: const BoxDecoration(
        color: Color(0xFFF4ECDD),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).maybePop(),
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Map Location',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 34),
          ],
        ),
      ),
    );
  }

  Widget _buildMapTypeChip() {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        width: 94,
        height: 29,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: const Row(
          children: [
            Text(
              'Map',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Satellite',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapToolbar() {
    return Positioned(
      top: 8,
      right: 8,
      child: Column(
        children: [
          Container(
            width: 32,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: const [
                Expanded(
                  child: Center(
                    child: Icon(Icons.add, size: 18, color: Colors.black87),
                  ),
                ),
                Divider(height: 1, thickness: 1, color: Color(0xFFE6E6E6)),
                Expanded(
                  child: Center(
                    child: Icon(Icons.remove, size: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: const Icon(
              Icons.my_location_rounded,
              size: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMockMap() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTapUp: (details) => _onMapTap(details, constraints),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/map_location.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFECECEC),
                            Color(0xFFDCDCDC),
                          ],
                        ),
                      ),
                      child: CustomPaint(
                        painter: _MockMapPainter(),
                        child: const SizedBox.expand(),
                      ),
                    );
                  },
                ),
              ),
              _buildMapTypeChip(),
              _buildMapToolbar(),
              Positioned(
                left: constraints.maxWidth * _pinPosition.dx - 16,
                top: constraints.maxHeight * _pinPosition.dy - 32,
                child: const Icon(
                  Icons.location_on,
                  size: 36,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMapCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(child: _buildMockMap()),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                color: Colors.white,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _selectedAddress,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 14, 42, 27),
      child: SizedBox(
        width: double.infinity,
        height: 59,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop({
              'address': _selectedAddress,
              'x': _pinPosition.dx,
              'y': _pinPosition.dy,
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A4A4A),
            elevation: 4,
            shadowColor: Colors.black.withValues(alpha: 0.20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29.5),
            ),
          ),
          child: const Text(
            'Confirm location',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4ECDD),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                _buildHeader(),
                _buildMapCard(),
                _buildBottomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MockMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    final minorRoadPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.45)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final parkPaint = Paint()
      ..color = const Color(0xFFCFE8C9);

    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.12, size.height * 0.18, size.width * 0.18, size.height * 0.14),
      parkPaint,
    );

    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.70, size.height * 0.62, size.width * 0.16, size.height * 0.12),
      parkPaint,
    );

    final major1 = Path()
      ..moveTo(size.width * 0.08, size.height * 0.78)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.55, size.width * 0.92, size.height * 0.18);
    canvas.drawPath(major1, roadPaint);

    final major2 = Path()
      ..moveTo(size.width * 0.18, 0)
      ..quadraticBezierTo(size.width * 0.30, size.height * 0.40, size.width * 0.36, size.height);
    canvas.drawPath(major2, roadPaint);

    final minor1 = Path()
      ..moveTo(0, size.height * 0.28)
      ..lineTo(size.width, size.height * 0.28);
    canvas.drawPath(minor1, minorRoadPaint);

    final minor2 = Path()
      ..moveTo(0, size.height * 0.52)
      ..lineTo(size.width, size.height * 0.52);
    canvas.drawPath(minor2, minorRoadPaint);

    final minor3 = Path()
      ..moveTo(size.width * 0.62, 0)
      ..lineTo(size.width * 0.62, size.height);
    canvas.drawPath(minor3, minorRoadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
