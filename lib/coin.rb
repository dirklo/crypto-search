class Coin
    attr_accessor :id, :symbol, :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(hash)
        hash.each do |k, v|
            self.send("#{k}=", v)
        end
        self.class.all << self
    end

    def self.find_by_symbol(input)
        self.all.detect{|i| i.symbol == input}
    end
    
    def self.find_by_name(input)
        self.all.detect{|i| i.symbol == input}
    end

    def display_current_price #displays current USD price of selected currency
        puts "--------------------------------------"
        puts "Current price for #{self.name}:"
        puts "+*+*+*+*+*"
        puts "$#{MarketScraper.get_price(self).values[0]} USD"
        puts "+*+*+*+*+*"
        puts "--------------------------------------" 
    end
end
