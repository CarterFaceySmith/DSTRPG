// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"
#include "content/CharacterStats.h"
#include "content/CharacterModel.h"
#include "qqmlcontext.h"

int main(int argc, char *argv[])
{
    set_qt_environment();

    QGuiApplication app(argc, argv);

    qmlRegisterType<CharacterModel>("DSTRPG", 1, 0, "CharacterModel");
    qmlRegisterType<CharacterStats>("DSTRPG", 1, 0, "CharacterStats");

    // Create the model and populate it with character stats
    CharacterModel charModel;
    CharacterStats charStats;
    std::unordered_map<std::string, CharacterStats> genericChars = charStats.generateGenericChars();

    for(auto character : genericChars) {
        charModel.addCharacter(character.second);
    }

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("charModel", &charModel);

    const QUrl url(u"qrc:/qt/qml/Main/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");

    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
