#include "plotdata.h"

#include <QDebug>

qreal p_sin(qreal x) { return qSin(x);}
qreal p_line(qreal x) { return x;}
qreal p_abs(qreal x) { return qFabs(x-2.5);}
qreal p_sqr(qreal x) { return qFabs(x*x);}
qreal p_log(qreal x) { return x > 0 ? log(x)/log(2) : -10;} //for 0 - some approximation

PlotData::PlotData(QObject *parent) : QObject(parent)
{
    init_x_values();
    calculate_y_values();
}

QVector<qreal> PlotData::x_vals()
{
    return x_values;
}

QVector<qreal> PlotData::y_vals()
{
    return y_values;
}

void PlotData::setPlotType(int newType)
{
    type = static_cast<PlotType>(newType);
    calculate_y_values();
}

int PlotData::getPlotType()
{
    return type;
}

void PlotData::init_x_values()
{
    for(int i = 0; i < DOTS_NUMBER ;++i){
        x_values.push_back(0.1*i);
    }
}

void PlotData::calculate_y_values()
{
    auto p_func = pick_function(type);
    y_values.clear();
    for(int i = 0; i < DOTS_NUMBER; ++i){
        y_values.push_back(p_func(x_values[i]));
    }
}

fSig PlotData::pick_function(PlotType type)
{
    switch(type){
        case SIN:
            return &p_sin;
            break;
        case LINE:
            return &p_line;
            break;
        case ABS:
            return &p_abs;
            break;
        case SQUARE:
            return &p_sqr;
            break;
        case LOG:
            return &p_log;
            break;
        default:
            break;
    }
}
