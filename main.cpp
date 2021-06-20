#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "movable_object.h"
#include "shipdata.h"
#include "auvdata.h"
#include "auvdatacontrol.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    ShipData shipData;
    qmlRegisterType<ShipData>("ShipData", 1, 0, "ShipData");

    AUVData auvData;
    qmlRegisterType<AUVData>("AUVData", 1, 0, "AUVData");

    AUVDataControl auvDataControl;
    qmlRegisterType<AUVDataControl>("AUVDataControl", 1, 0, "AUVControl");

    movable_object ship_object;
    qmlRegisterType<movable_object>("movable_object", 1, 0, "Moveable");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
