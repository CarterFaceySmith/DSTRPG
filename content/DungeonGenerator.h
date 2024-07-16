// DungeonGenerator.h
#ifndef DUNGEONGENERATOR_H
#define DUNGEONGENERATOR_H

#include <QObject>
#include <QVector>

class DungeonGenerator : public QObject
{
    Q_OBJECT

public:
    explicit DungeonGenerator(QObject *parent = nullptr);

    Q_INVOKABLE void generateDungeon(int width, int height);

    QVector<QVector<int>> getDungeonLayout() const;

private:
    QVector<QVector<int>> dungeonLayout;

signals:
    void dungeonGenerated();
};

#endif // DUNGEONGENERATOR_H
