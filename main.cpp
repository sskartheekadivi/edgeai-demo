#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ButtonsClicked.h"

qint32 ButtonsClicked::activeButton = 0;

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;

  ButtonsClicked buttonsClicked;
  PopupMenu popupMenu;
  engine.rootContext()->setContextProperty("buttonsClicked", &buttonsClicked);
  // engine.rootContext()->setContextProperty("activeButton", ButtonsClicked::activeButton);
  engine.rootContext()->setContextProperty("popupMenu", &popupMenu);

  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
