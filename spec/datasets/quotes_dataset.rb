class QuotesDataset < Dataset::Base

  def load
  
    quotes_data = YAML.load_file(File.dirname(__FILE__) + '/../../db/migrate/data/quotes.yml')
    quotes_data.each do |record| 
      create_model Quote, record[1]
    end
  end
  
  helpers do
    def min_valid_quote_params
      { :author => 'Rene Descartes',
        :quote => 'Cogito ergo sum'
      }  
    end
  end


end