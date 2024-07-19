#include "CharacterStats.h"
#include <vector>

CharacterStats::CharacterStats(QObject *parent)
    : QObject(parent), m_level(11), m_health(100), m_mana(100), m_attack(10), m_defence(10), m_intelligence(10), m_strength(10)
{
}

CharacterStats::CharacterStats(const CharacterStats &other)
    : QObject(other.parent()), m_name(other.m_name), m_level(other.m_level), m_health(other.m_health), m_mana(other.m_mana), m_attack(other.m_attack), m_defence(other.m_defence), m_intelligence(other.m_intelligence), m_strength(other.m_strength)
{
}

CharacterStats CharacterStats::createCharacter(QString name, int level, int health, int mana, int attack, int defence, int intelligence, int strength){
    CharacterStats charStats;
    charStats.setName(name);
    charStats.setLevel(level);
    charStats.setHealth(health);
    charStats.setMana(mana);
    charStats.setAttack(attack);
    charStats.setDefence(defence);
    charStats.setIntelligence(intelligence);
    charStats.setStrength(strength);
    return charStats;
}

std::unordered_map<std::string, CharacterStats> CharacterStats::generateGenericChars() {
    std::unordered_map<std::string, CharacterStats> genericCharMap;

    genericCharMap["Warrior"] = CharacterStats::createCharacter("Warrior", 1, 10, 0, 10, 10, 1, 10);
    genericCharMap["Rogue"] = CharacterStats::createCharacter("Rogue", 1, 7, 5, 7, 6, 5, 7);
    genericCharMap["Mage"] = CharacterStats::createCharacter("Mage", 1, 5, 10, 1, 5, 10, 1);
    genericCharMap["RINZLR"] = CharacterStats::createCharacter("RINZLR", 10, 30, 30, 30, 30, 30, 30);

    return genericCharMap;
}

CharacterStats &CharacterStats::operator=(const CharacterStats &other)
{
    if (this != &other) {
        m_name = other.m_name;
        m_health = other.m_health;
        m_mana = other.m_mana;
        m_attack = other.m_attack;
        m_defence = other.m_defence;
        m_level = other.m_level;
        m_intelligence = other.m_intelligence;
        m_strength = other.m_strength;
    }
    return *this;
}

CharacterStats::CharacterStats(const QString &name, int level, int health, int mana, int attack, int defence, int intelligence, int strength, QObject *parent)
    : QObject(parent), m_name(name), m_health(health), m_mana(mana), m_attack(attack), m_defence(defence), m_strength(strength)
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

int CharacterStats::level() const
{
    return m_level;
}

void CharacterStats::setLevel(int level)
{
    if (m_level == level)
        return;
    m_level = level;
    emit levelChanged();
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

int CharacterStats::mana() const
{
    return m_mana;
}

void CharacterStats::setMana(int mana)
{
    if (m_mana == mana)
        return;

    m_mana = mana;
    emit manaChanged();
}

int CharacterStats::intelligence() const
{
    return m_intelligence;
}

void CharacterStats::setIntelligence(int intelligence)
{
    if (m_intelligence == intelligence)
        return;

    m_intelligence = intelligence;
    emit intelligenceChanged();
}

int CharacterStats::strength() const
{
    return m_strength;
}

void CharacterStats::setStrength(int strength)
{
    if (m_strength == strength)
        return;
    m_strength = strength;
    emit strengthChanged();
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

int CharacterStats::defence() const
{
    return m_defence;
}

void CharacterStats::setDefence(int defence)
{
    if (m_defence == defence)
        return;

    m_defence = defence;
    emit defenceChanged();
}
