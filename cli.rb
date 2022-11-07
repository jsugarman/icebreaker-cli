require "tty-prompt"
require_relative "cli/banner"
require_relative "cli/questionairre"

CLI::Banner.render

questionairre = CLI::Questionairre.new

questionairre.start