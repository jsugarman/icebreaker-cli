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
        ask_question
      when 2
        year = enter_year
        fact_for_year(year)
      else
        random_fact
      end
    end

  private

    def type_choices
      {
        Question: 1,
        Year: 2,
        Random: 3
      }
    end

    def fact_for_year(year)
      puts "random fact for year #{year}"
    end

    def ask_question
      question = Question.random
      their_answer = prompt.ask(question.question)

      if their_answer.strip.downcase == question.answer.strip.downcase
        puts "Well done!"
      else
        puts "wrong answer!"
      end
    end

    def random_fact
      Question.random
    end

    def enter_year
      prompt.ask("Enter the year you were born (YYYY)") do |q|
        q.validate(/\A\d{4}\Z/)
        q.messages[:valid?] = "Must be 4 digits only" 
      end
    end
  end
end
