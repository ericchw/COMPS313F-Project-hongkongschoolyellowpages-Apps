import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hongkongschoolyellowpages/l10n/l10n.dart';
import 'package:hongkongschoolyellowpages/screens/home.dart';
import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TncScreen extends StatefulWidget {
  @override
  _TncScreenState createState() => _TncScreenState();
}

class _TncScreenState extends State<TncScreen> {
  @override
  void initState() {
    super.initState();
    _getLanguage();
  }

  Future<Null> _refresh() async {
    _getLanguage();
    return;
  }

  bool _isEn = false;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _setAcceptTnc(bool acceptTnc) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('acceptTnc', acceptTnc);
  }

  void _getLanguage() async {
    final SharedPreferences prefs = await _prefs;
    String _language = prefs.getString('language') ??
        "zh_Hant_TW"; //read lan setting en/zh-Hant-tw
    print("getLanguage: " + _language);
    switch (_language) {
      case "en":
        _isEn = true;
        print("getLanguage: bool en");
        break;
      case "zh_Hant_TW":
        _isEn = false;
        print("getLanguage: bool zh_Hant_TW");
        break;
      default:
        _isEn = false;
        print("getLanguage: bool default zh_Hant_TW");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        leading: const CircleAvatar(
          radius: 15.0,
          backgroundImage: AssetImage("assets/logos/logo.png"),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          AppLocalizations.of(context)!.tnc,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LanguageSettingScreen()),
                ).then((value) {
                  setState(
                    () {
                      _refresh(); // refresh state
                    },
                  );
                });
                //Navigator.pushNamed(context, 'LanguageSetting');
              },
              child: const Icon(
                Icons.public,
                color: Colors.black,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //sources: https://www.termsfeed.com/live/6af548b2-8d72-4d84-b988-64bc1ac11291
            _isEn ? HtmlWidget("""<h1>Terms and Conditions</h1>
              <p>Last updated: April 03, 2022</p>
              <p>Please read these terms and conditions carefully before using Our Service.</p>
              <h1>Interpretation and Definitions</h1>
              <h2>Interpretation</h2>
              <p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>
              <h2>Definitions</h2>
              <p>For the purposes of these Terms and Conditions:</p>
              <ul>
              <li>
              <p><strong>Application</strong> means the software program provided by the Company downloaded by You on any electronic device, named Hong Kong School Yellow Pages</p>
              </li>
              <li>
              <p><strong>Application Store</strong> means the digital distribution service operated and developed by Apple Inc. (Apple App Store) or Google Inc. (Google Play Store) in which the Application has been downloaded.</p>
              </li>
              <li>
              <p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>
              </li>
              <li>
              <p><strong>Country</strong> refers to:  Hong Kong Country</p>
              </li>
              <li>
              <p><strong>Company</strong> (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Hong Kong School Yellow Pages.</p>
              </li>
              <li>
              <p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>
              </li>
              <li>
              <p><strong>Service</strong> refers to the Application.</p>
              </li>
              <li>
              <p><strong>Terms and Conditions</strong> (also referred as "Terms") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the <a href="https://www.termsfeed.com/terms-conditions-generator/" target="_blank">Terms and Conditions Generator</a>.</p>
              </li>
              <li>
              <p><strong>Third-party Social Media Service</strong> means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.</p>
              </li>
              <li>
              <p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>
              </li>
              </ul>
              <h1>Acknowledgment</h1>
              <p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>
              <p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>
              <p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>
              <p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>
              <h1>Links to Other Websites</h1>
              <p>Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.</p>
              <p>The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>
              <p>We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.</p>
              <h1>Termination</h1>
              <p>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>
              <p>Upon termination, Your right to use the Service will cease immediately.</p>
              <h1>Limitation of Liability</h1>
              <p>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven't purchased anything through the Service.</p>
              <p>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</p>
              <p>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party's liability will be limited to the greatest extent permitted by law.</p>
              <h1>"AS IS" and "AS AVAILABLE" Disclaimer</h1>
              <p>The Service is provided to You "AS IS" and "AS AVAILABLE" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</p>
              <p>Without limiting the foregoing, neither the Company nor any of the company's provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.</p>
              <p>Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.</p>
              <h1>Governing Law</h1>
              <p>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.</p>
              <h1>Disputes Resolution</h1>
              <p>If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.</p>
              <h1>For European Union (EU) Users</h1>
              <p>If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.</p>
              <h1>United States Legal Compliance</h1>
              <p>You represent and warrant that (i) You are not located in a country that is subject to the Hong Kong government embargo, or that has been designated by the Hong Kong government as a "terrorist supporting" country, and (ii) You are not listed on any Hong Kong government list of prohibited or restricted parties.</p>
              <h1>Severability and Waiver</h1>
              <h2>Severability</h2>
              <p>If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.</p>
              <h2>Waiver</h2>
              <p>Except as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not effect a party's ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.</p>
              <h1>Translation Interpretation</h1>
              <p>These Terms and Conditions may have been translated if We have made them available to You on our Service.
              You agree that the original English text shall prevail in the case of a dispute.</p>
              <h1>Changes to These Terms and Conditions</h1>
              <p>We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.</p>
              <p>By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.</p>
              <h1>Contact Us</h1>
              <p>If you have any questions about these Terms and Conditions, You can contact us:</p>
              <ul>
              <li>
              <p>By email: sxxxxxx@hkmu.edu.hk</p>
              </li>
              <li>
              <p>By visiting this page on our website: <a href="www.hongkongschoolyellowpage.com" rel="external nofollow noopener" target="_blank">www.hongkongschoolyellowpage.com</a></p>
              </li>
              </ul>""") : HtmlWidget("""<h1>條款和細則</h1>
              <p>最近更新時間: 4月3日，2022年4月</p>
              <p>在使用我們的服務之前，請仔細閱讀這些條款和細則。</p>
              <h1>解釋和定義</h1>
              <h2>解釋</h2>
              <p>首先字母大寫的單詞都具有在以下細則下定義的含義。無論它們是否以奇異或複數出現，以下定義都應具有相同的含義。</p>
              <h2>定義</h2>
              <p>出於這些條款和細則的目的：</p>
              <ul>
              <li>
              <p><strong>應用</strong> 意味著您在任何電子設備上下載的公司提供的軟件計劃，名為香港學校黃頁</p>
              </li>
              <li>
              <p><strong>應用商店</strong> 表示由Apple Inc.（Apple App Store）或Google Inc.（Google Play商店）進行操作和開發的數字分發服務，其中已下載應用程序。</p>
              </li>
              <li>
              <p><strong>聯盟</strong> 意味著控制權的實體由締約方控製或受到一方的共同控制，其中“控制”意味著有權投票的50％或更多的股份，股權或其他證券的所有權，有權投票選舉董事或其他管理局。</p>
              </li>
              <li>
              <p><strong>國家</strong> 是指：香港</p>
              </li>
              <li>
              <p><strong>公司</strong> (在本協議中稱為“公司”，“我們”，“我們”或“我們”) 指香港學校黃頁。</p>
              </li>
              <li>
              <p><strong>設備</strong> 意味著任何可以訪問服務的設備，例如計算機，手機或數字平板電腦。</p>
              </li>
              <li>
              <p><strong>服務</ strong>是指應用程序。</p>
              </li>
              <li>
              <p><strong>條款和細則</ strong>（也稱為“術語”）是指在您與公司之間的整個協議方面，這些條款和細則在於使用服務。此術語和細則協議已在此處創建 <a href="https://www.termsfeed.com/terms-conditions-generator/" target="_blank">條款和細則發生器</a>.</p>
              </li>
              <li>
              <p><strong>第三方社交媒體服務</ strong>是指由服務提供或提供的第三方提供的任何服務或內容（包括數據，信息，產品或服務），包括或提供服務。</p>
              </li>
              <li>
              <p><strong>你</strong> 意味著個人訪問或使用該服務或公司或其他法人實體代表哪種個人正在訪問或使用該服務，如適用。</p>
              </li>
              </ul>
              <h1>確認</h1>
              <p>這些是管理本服務的使用條款和細則以及您與公司之間運營的協議。這些條款和細則列出了所有用戶對服務使用的權利和義務。</p>
              <p>您的訪問和使用服務是在接受和遵守這些條款和細則的情況下提供細則。這些條款和細則適用於訪問或使用該服務的所有訪問者，用戶和其他人。</p>
              <p>通過訪問或使用該服務，您同意受這些條款和細則的約束。如果您不同意這些條款和細則的任何部分，那麼您可能無法訪問該服務。</p>
              <p>您的訪問和使用此服務也可以接受和遵守本公司隱私政策。我們的隱私政策在使用申請或網站時，在您的個人信息上介紹我們的策略和程序，並在您使用該網站時告訴您您的隱私權以及法律如何保護您。請在使用我們的服務之前仔細閱讀我們的隱私政策。</p>
              <h1>鏈接到其他網站</h1>
              <p>我們的服務可能包含與公司不擁有或控制的第三方網站或服務的鏈接。</p>
              <p>該公司無法控制，並不承擔任何第三方網站或服務的內容，隱私政策或做法的責任。您進一步承認並同意，該公司不得直接或間接地應對或責任，因為涉及或涉及使用或依賴於任何此類內容，商品或服務造成或涉及的任何損害或涉及或通過任何此類網站或服務。</p>
              <p>我們強烈建議您閱讀您訪問的任何第三方網站或服務的條款和細則和隱私政策。</p>
              <h1>終止</h1>
              <p>我們可以立即終止或暫停您的訪問，恕不另行通知或責任，因為任何原因，如果您違反這些條款和細則，則包括但不限於此。</p>
              <p>終止後，您使用該服務的權利將立即停止。</p>
              <h1>責任限制</h1>
              <p>儘管您可能會造成的任何損害賠償，但在本條款的任何細則下，本公司的全部責任和其所有供應商都應限於您通過服務或100 USD實際支付的金額如果您還沒有通過該服務購買任何東西。</p>
              <p>在適用法律允許的最大範圍內，在任何情況下，公司或其供應商應對任何特殊，偶然，間接或間接損害負責（包括但不限於損失利潤，數據丟失或損失其他信息，對於業務中斷，用於人身傷害，損失隱私，或以任何方式與使用或無法使用該服務的服務，第三方軟件和/或第三方硬件，或者否則與此術語的任何提供），即使公司或任何供應商已被告知此類損害可能性，即使補救措施未能出現其基本目的。</p>
              <p>有些國家不允許排除默示的保證或限制偶然或後果損害的責任，這意味著上述一些限制可能不適用。在這些國家，各方的責任將僅限於法律允許的最大程度。</p>
              <h1>“按原樣”和“可用”免責聲明</h1>
              <p>該服務向您提供“按原樣”和“可用”以及所有故障和缺陷，沒有任何類型的保修。本公司以適用法律允許的最大範圍代表其代表其附屬公司及其各自的許可方和服務提供者，明確拒絕所有保證，無論是明確的，暗示，法定或其他方面的擔保服務，包括所有暗示的商人擔保保證，特定目的，標題和非侵權的健身，以及可能因交易，績效，使用或貿易實踐而出現的保證。不限於前述內容，該公司不提供保修或承諾，無論如何，該服務將滿足您的要求，實現任何預期結果，兼容或與任何其他軟件，應用程序，系統或服務一起工作沒有中斷，滿足任何性能或可靠性標准或無錯誤或任何錯誤或缺陷可以或將被糾正。</p>
              <p>在沒有限制前述內容的情況下，公司和任何公司的提供者都不會對任何形式，表達或暗示的任何代表或保修提供：（i）服務或提供服務或可用性，或信息，內容和材料或產品包括在內;（ii）服務將不間斷或無錯誤;（iii）通過服務提供的任何信息或內容的準確性，可靠性或貨幣;或（iv）從公司發送或代表公司發送的服務，其服務器，內容或電子郵件是沒有病毒，腳本，特洛伊木馬，蠕蟲，惡意軟件，計時或其他有害組件。</p>
              <p>一些司法管轄區不允許將某些類型的保證或關於消費者的適用法定權利排除，因此上述一些或全部除外和限制可能不適用於您。但在這種情況下，本節規定的排除和限制應適用於適用法律的最大範圍。</p>
              <h1>管理法</h1>
              <p>該國法律不包括其法律規則的衝突，應管理這一術語和您的服務使用。您對申請的使用也可能受到其他地方，國家，國家或國際法律的約束。</p>
              <h1>糾紛解析</h1>
              <p>如果您對該服務有任何疑慮或爭議，則同意首先嘗試通過聯繫本公司非正式地解決爭議。</p>
              <h1>對於歐洲（歐盟）用戶</h1>
              <p>如果您是歐洲聯盟消費者，您將受益於您居住的國家法律的任何強制性規定。</p>
              <h1>香港國安條例</h1>
              <p>您代表和保證（i）您不在一個受香港政府禁運的國家，或者由香港政府指定為“恐怖主義支持”國家，以及（ii）不是在任何香港政府列表的禁止或限制締約方列表。</p>
              <h1>可分割性和豁免</h1>
              <h2>可分割性</h2>
              <p>如果持有這些條款的任何規定是無法執行或無效的，則將改變和解釋，以實現此類規定的目標，以便在適用法律下盡可能最大，剩餘的規定將繼續全力和效果。</p>
              <h2>放棄</h2>
              <p>除本文提供的情況外，在這些條款下違反權利或要求履行義務的履行，不得影響締約方在此後任何時候何時行使或需要此類表現的能力，也不得豁免違規的豁免構成豁免任何後續違規行為。</p>
              <h1>翻譯解釋</h1>
              <p>如果我們在我們的服務中向您提供了這些條款和細則，可能已被翻譯。
              您同意原始的英語文本應在爭議的情況下佔上風。</p>
              <h1>改變這些條款和細則</h1>
              <p>我們以唯一的自由裁量權保留權利，以便隨時修改或更換這些術語。如果修訂是材料，我們將在任何新條款生效之前提供至少30天通知的合理努力。什麼構成材料變化將根據我們唯一的自由裁量權來確定。</p>
              <p>通過繼續訪問或使用我們的服務後，這些修訂生效後，您同意受修訂條款的約束。如果您不同意全部或部分的新條款，請停止使用該網站和服務。</p>
              <h1>聯繫我們</h1>
              <p>如果您對這些條款和細則有任何疑問，可以聯繫我們：</p>
              <ul>
              <li>
              <p>通過電子郵件：xxxx@hkmu.edu.hk</p>
              </li>
              <li>
              <p>通過訪問本網站上的此頁面：<a href="www.hongkongschoolyellowpage.com" rel="external nofollow noopener" target="_blank">www.hongkongschoolyellowpage.com</a></p>
              </li>
              </ul>"""),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: RaisedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(AppLocalizations.of(context)!.remind),
                          content: Text(
                              AppLocalizations.of(context)!.pleaseAcceptTnc),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.shade600,
                            Colors.orange.shade500,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            minWidth: 88.0,
                            minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RaisedButton(
                    onPressed: () {
                      _setAcceptTnc(true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())).then(
                        (value) {},
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal.shade600,
                            Colors.green.shade500,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            minWidth: 88.0,
                            minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.confirm,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
