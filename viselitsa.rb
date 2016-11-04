# encoding: utf-8
current_path = "./" + File.dirname(__FILE__)

require current_path + "/lib/game.rb"
require current_path + "/lib/result_printer.rb"
require current_path + "/lib/word_reader.rb"
require "unicode_utils/downcase"

printer = ResultPrinter.new

reader = WordReader.new
begin
  slovo = reader.read_from_file(current_path + '/data/words.txt')
rescue SystemCallError
  puts "Не удалось открыть файл words.txt"
end

game = Game.new(UnicodeUtils.downcase(slovo))

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end