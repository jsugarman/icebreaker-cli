require "tty-prompt"
require "pry-byebug"
require_relative "cli/banner"
require_relative "cli/questionairre"
require_relative "cli/question"

CLI::Banner.render

questionairre = CLI::Questionairre.new

questionairre.start