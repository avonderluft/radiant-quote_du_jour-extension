namespace :radiant do
  namespace :extensions do
    namespace :quote_du_jour do
      
      desc "Runs the migration of the Quote Du Jour extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          QuoteDuJourExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          QuoteDuJourExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Quote Du Jour to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from QuoteDuJourExtension"
        Dir[QuoteDuJourExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(QuoteDuJourExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
