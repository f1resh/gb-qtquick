#pragma once

#include <QObject>
#include <QVector>
#include <QtMath>

#define DOTS_NUMBER 51

typedef qreal (* fSig)(qreal param);

namespace PlotNamespace{
    Q_NAMESPACE
    enum PlotType{
        SIN,
        LINE,
        ABS,
        SQUARE,
        LOG
    };
   Q_ENUM_NS(PlotType)
}

using namespace PlotNamespace;
class PlotData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<qreal> x_values READ x_vals)
    Q_PROPERTY(QVector<qreal> y_values READ y_vals)
    Q_PROPERTY(int type READ getPlotType WRITE setPlotType)

public:
    explicit PlotData(QObject *parent = nullptr);
    QVector<qreal> x_vals();
    QVector<qreal> y_vals();
    void setPlotType(int);
    int getPlotType();

private:
    void init_x_values();
    void calculate_y_values(); //add function as argument
    fSig pick_function(PlotType);


private:
    QVector<qreal> x_values;
    QVector<qreal> y_values;
    PlotType type = PlotType::LINE;

};


