#include "CharacterStats.h"

CharacterStats::CharacterStats(QObject *parent)
    : QObject(parent), m_health(100), m_attack(50), m_defense(30)
{
}

CharacterStats::CharacterStats(const CharacterStats &other)
    : QObject(other.parent()), m_name(other.m_name), m_health(other.m_health), m_attack(other.m_attack), m_defense(other.m_defense)
{
}

CharacterStats &CharacterStats::operator=(const CharacterStats &other)
{
    if (this != &other) {
        m_name = other.m_name;
        m_health = other.m_health;
        m_attack = other.m_attack;
        m_defense = other.m_defense;
    }
    return *this;
}

CharacterStats::CharacterStats(const QString &name, int health, int attack, int defense, QObject *parent)
    : QObject(parent), m_name(name), m_health(health), m_attack(attack), m_defense(defense)
{
}

QString CharacterStats::name() const
{
    return m_name;
}

void CharacterStats::setName(const QString &name)
{
    if (m_name == name)
        return;

    m_name = name;
    emit nameChanged();
}

int CharacterStats::health() const
{
    return m_health;
}

void CharacterStats::setHealth(int health)
{
    if (m_health == health)
        return;

    m_health = health;
    emit healthChanged();
}

int CharacterStats::attack() const
{
    return m_attack;
}

void CharacterStats::setAttack(int attack)
{
    if (m_attack == attack)
        return;

    m_attack = attack;
    emit attackChanged();
}

int CharacterStats::defense() const
{
    return m_defense;
}

void CharacterStats::setDefense(int defense)
{
    if (m_defense == defense)
        return;

    m_defense = defense;
    emit defenseChanged();
}
