//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

input int ticket_to_close = 0; // Ticket a cerrar

CTrade trade;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(CheckForNewCandle())
     {
      OnBar();
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnBar()
  {
   trade.PositionClose(ticket_to_close);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseAllPositions()
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      trade.PositionClose(ticket);
     }
  }
//+------------------------------------------------------------------+
bool CheckForNewCandle()
  {
   static int LastCandleNumber;
   bool isNewCandle=false;
   int CandleNumber= Bars(_Symbol,_Period);
   if(LastCandleNumber<CandleNumber)
     {
      LastCandleNumber=CandleNumber;
      isNewCandle=true;
     }
   return isNewCandle;
  }
//+------------------------------------------------------------------+
