import 'package:bd_stock_trend/features/companies/domain/entities/company_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  final ScripDetailsInfo info;

  const CompanyInfo({required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company Name and Scrip
        Column(
          children: [
            Center(
              child: Text(
                info.fullName,
                style: const TextStyle(
                  fontSize: 20, // 1.5rem equivalent
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Text(
              "[${info.scrip}]",
              style: const TextStyle(fontSize: 20), // 1.5rem equivalent
            ),

            const SizedBox(width: 16),

            ChangeIndicator(value: info.changePer),
          ],
        ),

        const SizedBox(height: 16),

        // Company details in Grid
        ExpansionTile(
          title: Text('Company Information'),  // Title of the ExpansionTile
          initiallyExpanded: true,  // Whether it should be expanded initially
          children: [
            ListTile(
              title: Text("Prev Close:"),
              subtitle: Text(info.ycp.toString()),
            ),
            ListTile(
              title: Text("Open:"),
              subtitle: Text(info.openPrice.toString()),
            ),
            ListTile(
              title: Text("Day's Range:"),
              subtitle: Text(info.dayRange),
            ),
            ListTile(
              title: Text("52 Weeks Range:"),
              subtitle: Text(info.week52Range),
            ),
            ListTile(
              title: Text("Q1 EPS:"),
              subtitle: Text(info.q1Eps.toString()),
            ),
            ListTile(
              title: Text("Q2 EPS:"),
              subtitle: Text(info.q2Eps.toString()),
            ),
            ListTile(
              title: Text("Q3 EPS:"),
              subtitle: Text(info.q3Eps.toString()),
            ),
            ListTile(
              title: Text("Q4 EPS:"),
              subtitle: Text(info.q4Eps.toString()),
            ),
            ListTile(
              title: Text("Authorized Capital (mn):"),
              subtitle: Text(info.authorizedCap.toString()),
            ),
            ListTile(
              title: Text("MCap (Tk. in mn):"),
              subtitle: Text(info.marketCap.toString()),
            ),
            ListTile(
              title: Text("Total Volume:"),
              subtitle: Text(info.volume.toString()),
            ),
            ListTile(
              title: Text("Last AGM:"),
              subtitle: Text(info.lastAGMHeld),
            ),
            ListTile(
              title: Text("Listed Since:"),
              subtitle: Text(info.listingYear.toString()),
            ),
            ListTile(
              title: Text("Category:"),
              subtitle: Text(info.marketCategory),
            ),
            ListTile(
              title: Text("Total Shares:"),
              subtitle: Text(info.totalSecurities.toString()),
            ),
            ListTile(
              title: Text("Paid-Up Cap (mn):"),
              subtitle: Text(info.paidUpCap.toString()),
            ),
          ],
        ),


        // Company Contact Info
        ExpansionTile(
          title: Text("Company Address"),
          children: [
            ListTile(
              title: Text("Contact:"),
              subtitle: Text(info.contact),
            ),
            ListTile(
              title: Text("E-mail:"),
              subtitle: Text(info.email),
            ),
            ListTile(
              title: Text("Website:"),
              subtitle: GestureDetector(
                onTap: () => _launchURL(info.web),
                child: Text(
                  info.web,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            ListTile(
              title: Text("Address:"),
              subtitle: Text(info.address),
            ),
          ],
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    // Handle launching the URL in a browser
    // You can use the url_launcher package to achieve this.
  }
}

class InfoRow extends StatelessWidget {
  final String name;
  final String value;

  const InfoRow({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$name ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}

class ChangeIndicator extends StatelessWidget {
  final double value;

  const ChangeIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value >= 0 ? "+${value.toStringAsFixed(2)}%" : "${value.toStringAsFixed(2)}%",
      style: TextStyle(
        color: value >= 0 ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}