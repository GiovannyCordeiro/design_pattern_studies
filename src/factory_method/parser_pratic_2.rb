class FileParser
  def parser(_file_path)
    raise NotImplementedError, 'Subclass devem implementar o metodo parse'
  end
end

class JSONParser < FileParser
  def parser(file_path)
    puts "PARSEANDO JSON: #{file_path}"
  end
end

class CSVParser < FileParser
  def parser(file_path)
    puts "PARSEANDO SVG: #{file_path}"
  end
end

class XMLParser < FileParser
  def parser(file_path)
    puts "PARSEANDO XML: #{file_path}"
  end
end

class ParserFactory
  PARSERS = {
    "json" => JSONParser,
    "csv" => CSVParser,
    "xml" => XMLParser
  }.freeze

  def self.get_parser(file_type)
    parser_class = PARSERS[file_type.downcase]
    raise ArgumentError, "Formato do arquivo #{file_type} nao suportado" unless parser_class

    parser_class.new
  end
end

parser_example = ParserFactory.get_parser('csv')
parser_example.parser('exemplo.csv')











