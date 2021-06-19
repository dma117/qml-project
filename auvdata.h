#ifndef AUVDATA_H
#define AUVDATA_H

#include <qobject.h>

class AUVData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float height READ height WRITE setHeight NOTIFY heightChanged)
    Q_PROPERTY(float deep READ deep WRITE setDeep NOTIFY deepChanged)
    Q_PROPERTY(float speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(float direction READ direction WRITE setDirection NOTIFY directionChanged)

  public:
    AUVData(QObject *parent = nullptr);

    float height() const;
    void setHeight(float newHeight);

    float deep() const;
    void setDeep(float newDeep);

    float speed() const;
    void setSpeed(float newSpeed);

    float direction() const;
    void setDirection(float newDirection);

signals:
    void heightChanged(float message);
    void deepChanged(float message);
    void speedChanged(float message);
    void directionChanged(float message);

private:
    float m_height;
    float m_deep;
    float m_speed;
    float m_direction;
};

#endif // AUVDATA_H
