class MarketScraper

    def self.make_coins
        url = 'https://api.coingecko.com/api/v3/coins/list'
    
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        coins = JSON.parse(response.body)
        
        coins.each do |coin_attributes|
            Coin.new(coin_attributes)
        end
    end

    def self.get_price(coin)
        url = "https://api.coingecko.com/api/v3/simple/price?ids=#{coin.id}&vs_currencies=USD"

        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body).values[0]
    end
end
