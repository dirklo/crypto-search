require_relative '../config/environment'

MarketScraper.make_coins

puts "\n\n\n\n"
puts "------------------------------------"
puts "WELCOME TO CRYPTO SEARCH"
puts "------------------------------------\n\n\n\n"
while true
    puts "Enter a currency symbol to view its current price"
    input = gets.chomp
    Coin.find_by_symbol(input).display_current_price
    puts "Would you like to look up another coin? (Y/N)"
    answer = gets.chomp.downcase
    if answer == "n"
        break
    end 
end



