#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>
#include <qstring.h>
#include <QMediaPlayer>
#include <QList>
#include <backend.h>
#include <stdio.h>
#include <mylabel.h>


QString pipelineString = "gst-pipeline: v4l2src ! video/x-raw,framerate=30/1 ! decodebin ! videoconvert ! qtvideosink";

int main(int argc, char *argv[])
{
    // qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    // Register your class to QML
    qmlRegisterType<MyLabel>("MyLabelLib", 1, 0, "MyLabel");

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // engine.rootContext()->setContextProperty("pipeline", pipelineString);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    // To connect qt.quit() to qtcore.quit()
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &QGuiApplication::quit);

    // QVariant automatically detects your data type
    mylabel.myObject->setProperty("visible", QVariant(true));
    mylabel.myObject->setProperty("text", QVariant("Bye bye world!"));

    QQmlContext *context = new QQmlContext(engine.rootContext());
    // context->setContextProperty("pipeline", "gst-pipeline: v4l2src ! video/x-raw,framerate=30/1 ! decodebin ! videoconvert ! qtvideosink");
    QObject *rootObject = context->contextObject();

    printf("rootObject = %lX\n", (unsigned long int)rootObject);

    // QMediaPlayer *Pipeline = rootObject->findChild<QMediaPlayer*>();

    // printf("pipeline = %lX\n", (unsigned long int)Pipeline);    // engine.rootContext()->setContextProperty("pipeline", pipelineString);

    // printf("Hello World!!!\n\n");

    // if (Pipeline)
        // Pipeline->setMedia(QUrl("gst-pipeline: videotestsrc ! autovideosink"));
    // Pipeline->setProperty("source", "gst-pipeline: v4l2src ! video/x-raw,framerate=30/1 ! decodebin ! videoconvert ! qtvideosink");

    engine.load(url);

    return app.exec();
}
