QT += gui \
    xml \
    svg \
    widgets \
    printsupport

TARGET = afce
TEMPLATE = app
SOURCES += main.cpp \
    mainwindow.cpp \
    thelpwindow.cpp \
    zvflowchart.cpp \
    qflowchartstyle.cpp \
    sourcecodegenerator.cpp \
    qjson4/QJsonArray.cpp \
    qjson4/QJsonDocument.cpp \
    qjson4/QJsonObject.cpp \
    qjson4/QJsonParseError.cpp \
    qjson4/QJsonParser.cpp \
    qjson4/QJsonValue.cpp \
    qjson4/QJsonValueRef.cpp

HEADERS += mainwindow.h \
    thelpwindow.h \
    zvflowchart.h \
    qflowchartstyle.h \
    sourcecodegenerator.h \
    qjson4/QJsonArray.h \
    qjson4/QJsonDocument.h \
    qjson4/QJsonObject.h \
    qjson4/QJsonParseError.h \
    qjson4/QJsonParser.h \
    qjson4/QJsonRoot.h \
    qjson4/QJsonValue.h \
    qjson4/QJsonValueRef.h
RESOURCES += afce.qrc
CONFIG += release
TRANSLATIONS += ts/afce_en_US.ts \
    ts/afce_ru_RU.ts
win32 {
    RC_FILE += afce.rc
}

updatets.commands = lupdate $$_PRO_FILE_
updatets.target = updatets

updateqm.commands = lrelease $$_PRO_FILE_
updateqm.target = updateqm


QMAKE_EXTRA_TARGETS += updatets updateqm
POST_TARGETDEPS += updatets updateqm

win32 {
    copyqm.target = copyqm
    copyqm.commands = $$QMAKE_COPY $$shell_path($$_PRO_FILE_PWD_/ts/*.qm) ${DESTDIR}

    QMAKE_EXTRA_TARGETS += copyqm
    POST_TARGETDEPS += copyqm
}

    bins.path = /usr/bin
    bins.files = $${TARGET}
    help.path = /usr/share/afce/help
    help.files = help/*
    generators.path = /usr/share/afce/generators
    generators.files = generators/*
    qm.path = /usr/share/afce
    qm.extra = find ts -name "*.qm" -exec cp -pr {} $(INSTALL_ROOT)/usr/share/afce \\;
    icons.path = /usr/share/icons
    icons.files = afc.ico
    pixmaps.path = /usr/share/pixmaps
    pixmaps.files = afce.png
    desktopfile.path = /usr/share/applications
    desktopfile.files = afce.desktop
    mime.path = /usr/share/mime/packages
    mime.files = afce.xml
    INSTALLS += bins help qm icons desktopfile pixmaps mime generators
