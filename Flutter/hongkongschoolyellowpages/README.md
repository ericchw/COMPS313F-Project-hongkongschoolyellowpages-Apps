# hongkongschoolyellowpages

COMP 313F Flutter project which showing school infomation from target API (JSON format).

-----------------------------------------------------------------------------------------------

Features:
-ThemeMode to follow system theme (dark/light)
-Native splash screen (with icon and yellow backgroup)
-Lottie animation (schoolbus animation)
-Animation with button actionListener (startupViewScreen 開始button-> press and have click animation then naviagtor to tncScreen ) 
-language setting with sharedPrefs(default: zh_Hant_TW / en)
-changed language will pop toast
-TncScreen with sharedPrefs (Pressed accept and wont show tncScreen again)
    -btw TncScreen shows with HTML file
    -tncScreen change lanugage will auto onRefresh()
-Listing all school infomation
-scroll up  can onRefresh()
-Click and show all details
-Details Page: OpenMap to launch map apps (On iOS, map links as specified by Apple are launched. On Android, the geo intent is used as documented here. For web and other platforms, the plugin will simply launch Google Maps.)
-Details Page: Call function
-Details Page: Open website function
-search bar by searching schoolName
-sorting by ID or Name, ascend or desc

-----------------------------------------------------------------------------------------------

Pending:
-filter function
-iFrame to show map in details page

-----------------------------------------------------------------------------------------------

command for release package:
    Android - path: \build\app\outputs\flutter-apk\app-release.apk:
      -flutter build apk
    Windows- path: \build\windows\runner\Release:
      -flutter build windows
    ~ Web - \build\web:
    *just change to <base href="./"> (line 17)in index.html after you build the web.*
    *known issue -> splash screen stuck https://github.com/jonbhanson/flutter_native_splash/issues/324*
    *Workaround - debug using web*
      -flutter build web
    X IOS (xCode):
      *support, talk about in present or doc but no need build*
      -flutter build ios
    X macOS (xCode):
      *support, talk about in present or doc but no need build*
      -flutter build macos
    X Linux (xCode):
      *support, talk about in present or doc but no need build*
      -flutter build linux