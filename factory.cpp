#include "factory.h"
#include "shipdata.h"

Factory::Factory(QObject *parent) : QObject(parent) { }

QObject* Factory::createShipData()
{
  ShipData* shipData = new ShipData(this);

  shipData->setDirection(122);
  shipData->setRightSpeed(0.7);

  return shipData;
}
