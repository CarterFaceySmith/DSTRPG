#ifndef CHARACTERSTATS_H
#define CHARACTERSTATS_H

#include <QObject>

class CharacterStats : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int health READ health WRITE setHealth NOTIFY healthChanged)
    Q_PROPERTY(int attack READ attack WRITE setAttack NOTIFY attackChanged)
    Q_PROPERTY(int defence READ defence WRITE setDefence NOTIFY defenceChanged)
    Q_PROPERTY(int level READ level WRITE setLevel NOTIFY levelChanged)
    Q_PROPERTY(int intelligence READ intelligence WRITE setIntelligence NOTIFY intelligenceChanged)
    Q_PROPERTY(int strength READ strength WRITE setStrength NOTIFY strengthChanged)
    Q_PROPERTY(int mana READ mana WRITE setMana NOTIFY manaChanged)


public:
    explicit CharacterStats(QObject *parent = nullptr);
    CharacterStats(const CharacterStats &other); // Copy constructor
    CharacterStats &operator=(const CharacterStats &other); // Assignment operator

    CharacterStats(const QString &name, int level, int health, int mana, int attack, int defence, int intelligence, int strength, QObject *parent = nullptr);

    CharacterStats createCharacter(QString name, int level, int health, int mana, int attack, int defence, int intelligence, int strength);
    std::unordered_map<std::string, CharacterStats> generateGenericChars();

    QString name() const;
    void setName(const QString &name);

    int level() const;
    void setLevel(int level);

    int intelligence() const;
    void setIntelligence(int intelligence);

    int strength() const;
    void setStrength(int strength);

    int health() const;
    void setHealth(int health);

    int attack() const;
    void setAttack(int attack);

    int defence() const;
    void setDefence(int defence);

    int mana() const;
    void setMana(int mana);

signals:
    void nameChanged();
    void healthChanged();
    void attackChanged();
    void defenceChanged();
    void levelChanged();
    void intelligenceChanged();
    void strengthChanged();
    void manaChanged();

private:
    QString m_name;
    int m_health;
    int m_attack;
    int m_defence;
    int m_level;
    int m_intelligence;
    int m_strength;
    int m_mana;
};

#endif // CHARACTERSTATS_H
