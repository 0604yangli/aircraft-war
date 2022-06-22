# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo


#CONFIG += qmltypes
#QML_IMPORT_NAME = PlaneImage
INCLUDEPATH += Image
#QML_IMPORT_MAJOR_VERSION = 1

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.yourcompany.wizardEVP.Airport
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = ""

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

# RESOURCES += resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    imageextension.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

RESOURCES +=

DISTFILES += \
    qml/GameBackGround.qml \
    qml/PlayGame.qml \
    飞机大战素材/app.ico \
    飞机大战素材/bg.wav \
    飞机大战素材/bomb-1.png \
    飞机大战素材/bomb-2.png \
    飞机大战素材/bomb-3.png \
    飞机大战素材/bomb-4.png \
    飞机大战素材/bomb-5.png \
    飞机大战素材/bomb-6.png \
    飞机大战素材/bomb-7.png \
    飞机大战素材/bomb.wav \
    飞机大战素材/bullet_1.png \
    飞机大战素材/bullet_10.png \
    飞机大战素材/bullet_11.png \
    飞机大战素材/bullet_12.png \
    飞机大战素材/bullet_13.png \
    飞机大战素材/bullet_14.png \
    飞机大战素材/bullet_2.png \
    飞机大战素材/bullet_3.png \
    飞机大战素材/bullet_4.png \
    飞机大战素材/bullet_5.png \
    飞机大战素材/bullet_6.png \
    飞机大战素材/bullet_7.png \
    飞机大战素材/bullet_8.png \
    飞机大战素材/bullet_9.png \
    飞机大战素材/game.ico \
    飞机大战素材/hero.png \
    飞机大战素材/hero2.png \
    飞机大战素材/hero_bullet_7.png \
    飞机大战素材/img-plane_1.png \
    飞机大战素材/img-plane_2.png \
    飞机大战素材/img-plane_3.png \
    飞机大战素材/img-plane_4.png \
    飞机大战素材/img-plane_5.png \
    飞机大战素材/img-plane_6.png \
    飞机大战素材/img-plane_7.png \
    飞机大战素材/img_bg_level_1.jpg \
    飞机大战素材/img_bg_level_2.jpg \
    飞机大战素材/img_bg_level_3.jpg \
    飞机大战素材/img_bg_level_4.jpg \
    飞机大战素材/img_bg_level_5.jpg

HEADERS += \
    imageextension.h

