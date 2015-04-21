require 'yaml'

module TextAdventure
  class World
    def read_questions
      questions = {}
      Dir.glob(
        File.join(
          File.dirname(__FILE__),
          '..',
          'questions',
          '*.yml'
        )
      ).each do |file|
        key = File.basename(file, '.yml')
        questions[key] = Question.new YAML.load_file(file)
      end
      @questions = questions
    end

    def run
      read_questions
      key = 'ground_floor'
      while true do
        if key == 'win'
          puts @questions[key].question
          break
        end
        if key == 'death'
          puts @questions[key].question
          break
        end
        key = @questions[key].ask
      end
    end
  end

  class Question
    attr_accessor :question

    def initialize(data)
      @question = data['question']
      @answer = data['answers']
    end
    def ask
      begin
        puts @question
        @answer.each do |key,value|
          puts "  (#{key}) #{value['text']}"
        end
        input = gets
        return @answer[input.strip]['key']
      rescue
        puts 'No valid option'
        retry
      end
      return 'death'
    end
  end
end
