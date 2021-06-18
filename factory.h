#ifndef FACTORY_H
#define FACTORY_H

#include <QObject>

class Factory : public QObject
{
  public:
    explicit Factory(QObject *parent = nullptr);

    Q_INVOKABLE QObject* createShipData();
};

#endif // FACTORY_H
