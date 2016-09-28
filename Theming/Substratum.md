
## Intro tl;dr stuff ##
*When I started with theming, I found no proper guide to understand what I was really doing. So this is my verbose description on how you can get started on making your own theme for Substratum*


The stuff I'll write is what I did on a Linux machine, Ubuntu 16.04 to be precise (good pun for ubuntu 12.04). You will find setup stuff in my [installation script](https://github.com/SohamJ/Linux-tweaks/blob/master/installation.sh ). You can check how to install Android Studio and SDK on Google.

## Credits ##

All credits go to Team Substratum. You can check this [doc](https://docs.google.com/document/d/1w9yabpM91D0CKryszbyE4h8AND8mZz06MpM3cf4KpPg/edit) to check their G+, github, gerrit etc.

Special thanks to these folks for helping me out on theming:

* Sri Harsha
* Jimmy Setiawan
* David Wilson
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

##### Type 2 and 3 #####

Both type2 and type3 overlays are folders.

Let's start with type 3. Type3 is a completely different entity. It includes the complete res folder (everything - values (attributes, bools, colors, strings) and drawables).
So something like Gradient or Translucent in Magpie is an example of type3 overlay.

If you include the type3 overlay in your theme, you need to add the type3_{name} folder in every app that you theme (meaning every folder present in the overlay directory will have a type3 folder). The type3 spinner should come at the very top of the overlay list (BaseDark in the image above).

Type2 is an extension to type3 and this allows you to add some stuff instead of the whole res folder. This however can't modify attributes. Type2 can be used for custom icons or card styles, notification styles.. anything that you want to have multiple options for. Type2 is the 4th spinner if we add all 3 types of type1 overlays. (More Options in the image above).

The main difference in type2 and type3 is that type2 is independent of the framework. It is a separate bundle of resources that you can theme without the need of using framework resources. Type3 is dependent on framework.

### Approach ###

* Decompile the app you want to theme using apktool (apktool d app.apk).

* Open AndroidManifest.xml and copy the packagename (eg. com.android.google.keep).

* Create a directory in overlay folder (src/main/assets/overlay) with the same name as that of the package name.

* Create a res folder. This will house all the overlay stuff.

#### Colors ####

* Start with values/colors.xml. What I do is copy the colors.xml from the app to the overlay folder and edit every resource.

*Note :*
    1. You can either use hardcoded colors (e.g. #ffffff or #6f33b5e5, where 6f denotes transparency) or use @android:color/xyz (e.g. @android:color/holo_blue_dark , @android:color/background_dark etc.).

    2. DO NOT keep any instances of @color, @dimen in the resources. This will lead to ResourceNotFoundExceptions.

    3. If you are modifying arrays, add all the entries in an array even if you are modifying a few of them.

 * Check if there are colors.xml in values-v(11-24) and follow the same approach.

#### Color and Drawable

*Note :*
  My approach for these folders is to find xml files that have either hardcoded values or @android:color values. You can check my [grep](https://github.com/SohamJ/Linux-tweaks/blob/master/Scripts/copygrepfiles.sh) script that copies all files with patterns such as "#" and "android:color" to the overlay directory. There you can edit the values.

  * Check if the app has color directory. This usually has text colors that you can change if your theme is dark.

  * Modify vector drawables that are hardcoded.

  * Png's are a pain, for you need to batch color them (especially for a dark theme). Use my [batch color](https://github.com/SohamJ/Linux-tweaks/blob/master/Scripts/colorize.sh) script to color pngs.

  *Note:* Do not use the script for .9.png, you need to manually edit them.

#### Styles ####

 You can refer this [guide](https://plus.google.com/+StefanoTrevisani/posts/gJCQGVE39SL) (Credits Stefano) about styles.
  * Following similar approach as of colors, I look for instances of hardcoded colors and @android:color. I copy over the styles having these and modify the values.

* If there are references to a drawable, add those in /res/drawable. I replace references to @dimen with their actual value defined in dimens.xml.

* For styles, you need to add the parent of the style until the parent is a android:style (that's defined in framework).


### To-do ###

* Anti piracy
* Hero image
