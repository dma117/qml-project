#ifndef AUVDATA_H
#define AUVDATA_H

#include <qobject.h>

class AUVData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float high READ high WRITE setHigh NOTIFY highChanged)
    Q_PROPERTY(float deep READ deep WRITE setDeep NOTIFY deepChanged)
    Q_PROPERTY(float speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(float direction READ direction WRITE setDirection NOTIFY directionChanged)

  public:
    AUVData(QObject *parent = nullptr);

    float high() const;
    void setHigh(float newHigh);

    float deep() const;
    void setDeep(float newDeep);

    float speed() const;
    void setSpeed(float newSpeed);

    float direction() const;
    void setDirection(float newDirection);

signals:
    void highChanged(float message);
    void deepChanged(float message);
    void speedChanged(float message);
    void directionChanged(float message);

private:
    float m_high;
    float m_deep;
    float m_speed;
    float m_direction;
};

#endif // AUVDATA_H
