#include "controller.h"

void Controller::handleResults(float xPos, float yPos)
{
    emit operate(xPos, yPos);
}
