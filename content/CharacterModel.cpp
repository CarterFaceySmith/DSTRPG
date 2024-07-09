#include "CharacterModel.h"

CharacterModel::CharacterModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int CharacterModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return m_characters.count();
}

QVariant CharacterModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_characters.size())
        return QVariant();

    const CharacterStats &character = m_characters[index.row()];

    switch (role) {
    case NameRole:
        return character.name();
    case HealthRole:
        return character.health();
    case AttackRole:
        return character.attack();
    case DefenseRole:
        return character.defense();
    default:
        return QVariant();
    }
}

void CharacterModel::set(int index, const QString &role, const QVariant &value)
{
    if (index < 0 || index >= m_characters.size())
        return;

    CharacterStats &character = m_characters[index];

    if (role == "name") {
        character.setName(value.toString());
    } else if (role == "health") {
        character.setHealth(value.toInt());
    } else if (role == "attack") {
        character.setAttack(value.toInt());
    } else if (role == "defense") {
        character.setDefense(value.toInt());
    }

    QModelIndex idx = createIndex(index, 0);
    emit dataChanged(idx, idx, { roleNames().key(role.toUtf8()) });
}

QVariantMap CharacterModel::get(int index) const
{
    QVariantMap map;
    if (index >= 0 && index < m_characters.size()) {
        const CharacterStats &character = m_characters[index];
        map["name"] = character.name();
        map["health"] = character.health();
        map["attack"] = character.attack();
        map["defense"] = character.defense();
    }
    return map;
}

QHash<int, QByteArray> CharacterModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[HealthRole] = "health";
    roles[AttackRole] = "attack";
    roles[DefenseRole] = "defense";
    return roles;
}

bool CharacterModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid() || index.row() >= m_characters.size())
        return false;

    CharacterStats &character = m_characters[index.row()];

    switch (role) {
    case NameRole:
        character.setName(value.toString());
        break;
    case HealthRole:
        character.setHealth(value.toInt());
        break;
    case AttackRole:
        character.setAttack(value.toInt());
        break;
    case DefenseRole:
        character.setDefense(value.toInt());
        break;
    default:
        return false;
    }

    emit dataChanged(index, index, { role });
    return true;
}

Qt::ItemFlags CharacterModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable | Qt::ItemIsEnabled | Qt::ItemIsSelectable;
}

void CharacterModel::addCharacter(const CharacterStats &character)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_characters.append(character);
    endInsertRows();
}

void CharacterModel::removeCharacter(int index)
{
    if (index < 0 || index >= m_characters.size())
        return;

    beginRemoveRows(QModelIndex(), index, index);
    m_characters.removeAt(index);
    endRemoveRows();
}

void CharacterModel::clearModel()
{
    beginResetModel();
    m_characters.clear();
    endResetModel();
}
