# encoding: utf-8
current_path = "./" + File.dirname(__FILE__)

require current_path + "/lib/game.rb"
require current_path + "/lib/result_printer.rb"
require current_path + "/lib/word_reader.rb"
require "unicode_utils/upcase"

VERSION = "Игра виселица, version 4. \n\n"

reader = WordReader.new
begin
  word = reader.read_from_file(current_path + '/data/words.txt')
rescue SystemCallError
  puts "Не удалось открыть файл words.txt"
end

game = Game.new(UnicodeUtils.upcase(word))
game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress? do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)