#ifndef CHARACTERMODEL_H
#define CHARACTERMODEL_H

#include <QAbstractListModel>
#include <QList>
#include "CharacterStats.h"

class CharacterModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum CharacterRoles {
        NameRole = Qt::UserRole + 1,
        HealthRole,
        AttackRole,
        DefenceRole
    };

    explicit CharacterModel(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    // Editable model methods:
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;

    // Methods to modify the model:
    void addCharacter(const CharacterStats &character);
    void removeCharacter(int index);
    void clearModel();

    // Access methods for QML integration:
    Q_INVOKABLE QVariantMap get(int index) const;
    Q_INVOKABLE void set(int index, const QString &role, const QVariant &value);

private:
    QList<CharacterStats> m_characters;
};

#endif // CHARACTERMODEL_H
