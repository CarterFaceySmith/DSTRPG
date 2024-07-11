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

    qmlRegisterType<CharacterModel>("MyApp", 1, 0, "CharacterModel");

    // Create the main character stats object
    int var = 100;
    CharacterStats characterStats1;
    QString name1 = "Warrior";
    characterStats1.setName(name1);
    characterStats1.setHealth(var);
    characterStats1.setAttack(var);
    characterStats1.setDefense(var);

    CharacterStats characterStats2;
    QString name2 = "Wizard";
    characterStats2.setName(name2);
    characterStats2.setHealth(var);
    characterStats2.setAttack(var);
    characterStats2.setDefense(var);

    CharacterStats characterStats3;
    QString name3 = "Rogue";
    characterStats3.setName(name3);
    characterStats3.setHealth(var);
    characterStats3.setAttack(var);
    characterStats3.setDefense(var);


    // Create the model and populate it with character stats
    CharacterModel characterModel;
    characterModel.addCharacter(characterStats1);
    characterModel.addCharacter(characterStats2);
    characterModel.addCharacter(characterStats3);

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
