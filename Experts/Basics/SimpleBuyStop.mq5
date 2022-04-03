//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

input double entry_volume = 0.01; // Volumen de compra: acciones/lotes
input double entry_price = 1.18; // Precio de compra
input double stop_loss = 0.00; // Stop loss
input double take_profit = 0.00; // Take profit
input int total_orders = 1; // Ordenes totales por accion

CTrade trade;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   Print("OrdersTotal:", OrdersTotal());
   Print("PositionsTotal:", PositionsTotal());
// if we have no open orders or positions
   if((OrdersTotal()<total_orders)
   //&&(PositionsTotal()==0)
     )
     {
      trade.BuyLimit(
         entry_volume,
         entry_price,
         _Symbol,
         stop_loss,
         take_profit,
         ORDER_TIME_GTC,
         0,
         "Mi comentario"
      );
     }
  }
//+------------------------------------------------------------------+
