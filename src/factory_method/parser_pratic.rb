class ParserDocument
  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def execute(document)
    type_document = factory_method
    "Executando o processamento do documento, com a logica do arquivo '#{type_document.analisy(document)}'"
  end
end

class JSONParser < ParserDocument
  def factory_method
    JSONDocument.new
  end
end

class XMLParser < ParserDocument
  def factory_method
    XMLDocument.new
  end
end

class DocumentType
  def analisy(document)
    'Analise do documento x'
  end
end

class JSONDocument < DocumentType
  def analisy(document)
    "Analise JSON do documento: '#{document}'"
  end
end


class XMLDocument < DocumentType
  def analisy(document)
    "Analise XML do documento: '#{document}'"
  end
end


json_result = JSONParser.new
puts json_result.execute('documento_aleatorio.json')







