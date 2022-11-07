module CLI
    class Questionairre

    attr_reader :prompt

    def initialize
      @prompt = TTY::Prompt.new
    end

  # name = prompt.ask("What is your name?", default: ENV["USER"])
  # puts "hello #{name}"

    def start
      type = prompt.select("Choose icebreaker type?", type_choices)

      case type
      when 1
        year = enter_year
        find_fact_for_year(year)
      else
        find_random_fact
      end
    end

  private

    def type_choices
      {
        Year: 1,
        Random: 2
      }
    end

    def find_fact_for_year(year)
      puts "random fact for year #{year}"
    end

    def find_random_fact
      puts "random fact"
    end

    def enter_year
      prompt.ask("Enter the year you were born (YYYY)") do |q|
        q.validate(/\A\d{4}\Z/)
        q.messages[:valid?] = "Must be 4 digits only" 
      end
    end
  end
end