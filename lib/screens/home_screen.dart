import 'package:create_screen_flow_app/utils/colors.dart'; 
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!', style: TextStyle(color: primaryColor, fontSize: 16)),
                Text('Mr Ilias', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textPrimary)),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Dashboard'),
              Tab(text: 'Cashflow'),
            ],
            labelColor: primaryColor,
            unselectedLabelColor: textSecondary,
            indicatorColor: primaryColor,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DashboardContent(),
                Container(child: Center(child: Text('Cashflow content'))),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.menu, 'Management', true),
            _buildBottomNavItem(Icons.swap_horiz, 'Transactions', false),
            _buildBottomNavItem(Icons.diamond, 'Pro Account', false),
            _buildBottomNavItem(Icons.description, 'Invoicing', false),
            _buildBottomNavItem(Icons.more_horiz, 'More', false),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? primaryColor : textSecondary),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: isActive ? primaryColor : textSecondary, fontSize: 12)),
      ],
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: textSecondary.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Result', style: TextStyle(color: textSecondary)),
                      Text('\$7,199', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text('Exercise 2024', style: TextStyle(color: primaryColor)),
                        Icon(Icons.arrow_drop_down, color: primaryColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              child: Row(
                children: [
                  ...['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec']
                      .asMap()
                      .entries
                      .map((entry) {
                    final height = [100, 150, 300, 200, 250, 350, 400, 200, 150, 100, 50, 25][entry.key] * 0.6;
                    final color = entry.key % 2 == 0 ? primaryColor : primaryLight;
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: height,
                              width: 15,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard('Revenue', '\$23,883', secondaryColor, Icons.trending_up),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildMetricCard('Expenses', '\$13,883', errorColor, Icons.trending_up),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: textSecondary.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Financial Summary', style: TextStyle(color: textSecondary)),
                      SizedBox(width: 8),
                      Icon(Icons.info_outline, size: 18, color: textSecondary),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('\$6,119', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary)),
                  SizedBox(height: 10),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Text('67%', style: TextStyle(fontSize: 12))),
                          ),
                          SizedBox(width: 10),
                          Text('Get Started on Soly', style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String amount, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textSecondary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
              SizedBox(width: 8),
              Text(title, style: TextStyle(color: textSecondary)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(amount, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary)),
              SizedBox(width: 5),
              Icon(icon, size: 16, color: color),
            ],
          ),
        ],
      ),
    );
  }
}