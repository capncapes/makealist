module RandomData
    def self.random_email
        "#{random_word}@#{random_word}.#{random_word}"
    end
    
    def self.random_name
        first = random_word.capitalize
        last = random_word.capitalize
        "#{first} #{last}"
    end
    
    def self.random_word
        letters = ('a'..'z').to_a
        letters.shuffle!
        letters[0, rand(3..8)].join
    end
    
    def self.random_sentence
        strings = []
        rand(3..8).times do
            strings << random_word
        end
        sentence = strings.join(" ")
        sentence.capitalize << "."
    end
    
    def self.random_paragraph
        sentences = []
        rand(1..4).times do
            sentences << random_sentence
        end
        sentences.join(" ")
    end
    
    def self.random_price
        rand * 199.99
    end
    
    def self.random_rank
        li = ::List.last
        pr = li.products.count
        if li.products
            pr + 1
        else
            1
        end
    end
end