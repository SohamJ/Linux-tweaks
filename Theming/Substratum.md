
## Intro tl;dr stuff ##
*When I started with theming, I found no proper guide to understand what I was really doing. So this is my verbose description on how you can get started on making your own theme for Substratum*


The stuff I'll write is what I did on a Linux machine, Ubuntu 16.04 to be precise (good pun for ubuntu 12.04). You will find setup stuff in my [installation script](https://github.com/SohamJ/Linux-tweaks/blob/master/installation.sh ). You can check how to install Android Studio and SDK on Google.


Let's get started..

(Key : AS = Android Studio)

 ## Some prior things ##
Some things you'll need to check/install before you start with theming:

1. Android SDK
2. ADB (you can check [this](https://github.com/SohamJ/Linux-tweaks/blob/master/installation.sh ) script again for setting up adb and udev
3. Android support repository

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
