#include "shipdata.h"
#include <QVariant>
#include <iostream>

ShipData::ShipData(QObject *parent) : QObject(parent)
{
  m_direction = 45;
  m_rightSpeed = 0.3;
  m_forwardSpeed = 0.1;
}

float ShipData::forwardSpeed() const
{
  return m_forwardSpeed;
}

void ShipData::setForwardSpeed(float newForwardSpeed)
{
  if (m_forwardSpeed == newForwardSpeed)
      return;

  m_forwardSpeed = newForwardSpeed;
  emit forwardSpeedChanged(m_forwardSpeed);
}

float ShipData::rightSpeed() const
{
  return m_rightSpeed;
}

void ShipData::setRightSpeed(float newRightSpeed)
{
  if (m_rightSpeed == newRightSpeed)
      return;

  m_rightSpeed = newRightSpeed;
  emit rightSpeedChanged(m_rightSpeed);
}

float ShipData::direction()
{
  auto tmp = m_direction;

  setDirection(++m_direction);

  std::cout << m_direction;

  return tmp;
}

void ShipData::setDirection(float newDirection)
{
  if (m_direction == newDirection)
      return;

  m_direction = newDirection;
  emit directionChanged(m_direction);
}
