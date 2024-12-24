def stock_picker(stock_prices)  
  profit = -Float::INFINITY
  best_days = [-1, -1] 
  for buy_day in 0...stock_prices.size 
    for sell_day in buy_day+1...stock_prices.size
      new_profit = stock_prices[sell_day] - stock_prices[buy_day] 
      if new_profit > profit
        profit = new_profit
        best_days = [buy_day, sell_day] 
      end
    end
  end

  profit < 0 ? [0, 0] : best_days 
end 

stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
p stock_picker(stock_prices)
