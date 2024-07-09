#ifndef CHARACTERSTATS_H
#define CHARACTERSTATS_H

#include <QObject>

class CharacterStats : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int health READ health WRITE setHealth NOTIFY healthChanged)
    Q_PROPERTY(int attack READ attack WRITE setAttack NOTIFY attackChanged)
    Q_PROPERTY(int defense READ defense WRITE setDefense NOTIFY defenseChanged)

public:
    explicit CharacterStats(QObject *parent = nullptr);
    CharacterStats(const CharacterStats &other); // Copy constructor
    CharacterStats &operator=(const CharacterStats &other); // Assignment operator

    CharacterStats(const QString &name, int health, int attack, int defense, QObject *parent = nullptr);

    QString name() const;
    void setName(const QString &name);

    int health() const;
    void setHealth(int health);

    int attack() const;
    void setAttack(int attack);

    int defense() const;
    void setDefense(int defense);

signals:
    void nameChanged();
    void healthChanged();
    void attackChanged();
    void defenseChanged();

private:
    QString m_name;
    int m_health;
    int m_attack;
    int m_defense;
};

#endif // CHARACTERSTATS_H
