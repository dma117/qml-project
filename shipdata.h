#ifndef SHIPDATA_H
#define SHIPDATA_H

#include <QObject>

class ShipData : public QObject
{
  Q_OBJECT

  Q_PROPERTY(float direction READ direction WRITE setDirection NOTIFY directionChanged)
  Q_PROPERTY(float rightSpeed READ rightSpeed WRITE setRightSpeed NOTIFY rightSpeedChanged)
  Q_PROPERTY(float forwardSpeed READ forwardSpeed WRITE setForwardSpeed NOTIFY forwardSpeedChanged)

  public:
    explicit ShipData(QObject *parent = nullptr);

    float direction();
    float rightSpeed() const;
    float forwardSpeed() const;

  public slots:
      void setDirection(float newDirection);
      void setRightSpeed(float newRightSpeed);
      void setForwardSpeed(float newForwardSpeed);

  signals:
      void directionChanged(float message);
      void rightSpeedChanged(float message);
      void forwardSpeedChanged(float message);

  private:
    float m_direction;
    float m_rightSpeed;
    float m_forwardSpeed;
};

#endif // SHIPDATA_H
