#include <QObject>

class ButtonsClicked : public QObject {
    Q_OBJECT
public:
    explicit ButtonsClicked (QObject* parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QString leftMenuButton1Clicked() {
        return QString("gst-pipeline: videotestsrc pattern=0 ! qtvideosink");
    }
    Q_INVOKABLE QString leftMenuButton2Clicked() {
        return QString("gst-pipeline: videotestsrc pattern=1 ! qtvideosink");
    }
    Q_INVOKABLE QString leftMenuButton3Clicked() {
        return QString("gst-pipeline: videotestsrc pattern=18 ! qtvideosink");
    }
    Q_INVOKABLE QString leftMenuButton4Clicked() {
        return QString("gst-pipeline: videotestsrc pattern=18 ! qtvideosink");
    }
};
