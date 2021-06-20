#ifndef AUVDATACONTROL_H
#define AUVDATACONTROL_H

#include <qobject.h>

class AUVDataControl : public QObject
{
    Q_OBJECT
  public:
    AUVDataControl(QObject *parent = nullptr);
};

#endif // AUVDATACONTROL_H
