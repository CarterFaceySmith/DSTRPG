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

    qmlRegisterType<CharacterModel>("PersonaKnockoffApp", 1, 0, "CharacterModel");

    // Create the main character stats object
    CharacterStats characterStats;
    characterStats.setName("Hero");
    characterStats.setHealth(100);
    characterStats.setAttack(50);
    characterStats.setDefense(30);

    // Create the model and populate it with character stats
    CharacterModel characterModel;
    characterModel.addCharacter(characterStats);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("characterModel", &characterModel);

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
