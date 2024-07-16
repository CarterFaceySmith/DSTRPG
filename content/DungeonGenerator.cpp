// DungeonGenerator.cpp
#include "DungeonGenerator.h"

DungeonGenerator::DungeonGenerator(QObject *parent)
    : QObject(parent)
{
}

void DungeonGenerator::generateDungeon(int width, int height)
{
    // Implement WFC algorithm to generate dungeon layout
    // Populate dungeonLayout with generated data
    // Emit signal dungeonGenerated() when generation is complete
    emit dungeonGenerated();
}

QVector<QVector<int>> DungeonGenerator::getDungeonLayout() const
{
    return dungeonLayout;
}
