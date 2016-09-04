
## Intro tl;dr stuff ##
*When I started with theming, I found no proper guide to understand what I was really doing. So this is my verbose description on how you can get started on making your own theme for Substratum*


The stuff I'll write is what I did on a Linux machine, Ubuntu 16.04 to be precise (good pun for ubuntu 12.04). You will find setup stuff in my [installation script](https://github.com/SohamJ/Linux-tweaks/blob/master/installation.sh ). You can check how to install Android Studio and SDK on Google.

## Credits ##

All credits go to Team Substratum. You can check this [doc](https://docs.google.com/document/d/1w9yabpM91D0CKryszbyE4h8AND8mZz06MpM3cf4KpPg/edit) to check their G+, github, gerrit etc.

Special thanks to these folks for helping me out on theming:

* Sri Harsha
* Jimmy Setiawan
* Dave Kessler
* Syko Pompos
* Nicholas Chum


Cool, let's get started..

(Key : AS = Android Studio)

## Some prior things ##

Some things you'll need to check/install before you start with theming:

1. Android SDK
2. ADB (you can check [this](https://github.com/SohamJ/Linux-tweaks/blob/master/installation.sh ) script again for setting up adb and udev
3. Android support repository
4. Apktool

## Theme Template ##

### Refactoring ###
1. Go to the template [github](https://github.com/TeamSubstratum/SubstratumThemeTemplate#substratumthemetemplate) page. Download the repo as a zip or clone the repo. If you want to open-source your theme, you can fork the repo.

2. Open the project in Android Studio. Open the project panel by clicking on the project button in the left sidebar. Collapse the gradle script list and open build.grade (module:app)

3. Change the applicationId from "substratum.theme.template" to "com.organization_name.theme_name". AS will ask you to sync the project.

4. Go to the project settings (gear icon on the Project window toolbar) and make sure 'Compact empty middle packages' is unchecked. Collapse all folders under java. You will see three subfolders: substratum, theme and template.

5. Now rename each folder according to your applicatioId. substratum -> com, theme -> organization_name and template -> theme_name. Right click on each folder and do Refactor -> rename. If you get an error saying the file already exists, go to app/build/generated/source/r/debug and remove the folder with the folder name you are currently trying to rename to. Press on 'Do refactor' and refactor all the 3 folders.

### Manifest ###

There are three things to edit here.

1. Legacy support: Keeping the value of Substratum legacy as true supports both RRO and OMS.

2. Click on the theme name and author meta-data which will show you resources @string/ThemeName and @string/ThemeAuthor. Modify both in res/values/strings.xml.

## Themeing ##

*Note*: I haven't dealt with audio, fonts and bootanimation as of yet. I'll add that once I do. The template readme has sufficient documentation for it. What went over my head is the overlays part. And I'll *try* to explain s that stuff. Themers, if you read this, kindly correct me if I am wrong.

* To theme a app, the basic process is as follows:

  1. go to app/src/main/assets/overlays and make a directory with the name same as that of the package name of the app. You can find it in the manifest of the app. eg. package="com.google.android.deskclock".

  2. Create a folder res. This folder will contain all the theming stuff associated with app. Common folders are values, values-v21 ( values for API>21), drawable, drawable-{hdpi, xhdpi, xxhdpi, xxxhdpi}. Common files in values include colors.xml, styles.xml and attrs.xml

  3. Decompile the original app using apktool. If the app is open source, you can download its source as a zip or check the files on github.

  4. Modify the files (details below) and add them to your overlay folder.

### Substratum Options Guide ###

To understand what these options are, head over to the overlays/android folder. The template has a few examples of all the three types taken from magpie theme by Jimmy. Now I'll try to explain what these 3 types exactly are.

*Note* : You'll see 3 files in the overlays/android folder - type1a, type1b, type1c (no extensions). These files hold the names "Primary", "Accent" and "Background".


##### Type1 #####

  This option allows us to hotswap a file over the existing one in the app. The resources present in the type1 files (a,b,c) hotswap those values in res/values of an application.

  __Type1a__

  This file holds 2 values: "holo_blue_light" and "holo_blue_dark". Both correspond to the primary colors. You can set both to the same value or have two different primary values.

  Type1a_(colorname).xml is the format of your primary colors. These files will appear in the form of an entry in the 1st spinner of android system.

  __Type1b__

  This file holds 1 value: "holo_blue_bright". This corresponds to the accent value.

  __Type 1c__

This file holds 2 values: "holo_purple" and "background_dark". Background_dark is the main background, whereas holo_purple can be used for floating windows, cards, or elevated backgrounds. Depends on you how you want to theme it.


![Magpie Android spinners](https://github.com/SohamJ/Linux-Tweaks/raw/master/Theming/images/01.png "Type1")

Adding type1 files will add entries in the respective spinners.
