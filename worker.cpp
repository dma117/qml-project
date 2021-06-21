#include "worker.h"

Worker::Worker(QObject *parent) : QObject(parent)
{  
}

void Worker::start_test()
{
    connect(&thread_, &QThread::started, this, &Worker::run);
    moveToThread(&thread_);
    thread_.start();
}

void Worker::run()
{
    while(1) {
        emit positionChanged(xPositions[position], yPositions[position]);
        position = (position + 1) % 5;
        thread_.sleep(4);
    }
}
