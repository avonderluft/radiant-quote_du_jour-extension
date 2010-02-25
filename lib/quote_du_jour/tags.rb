module QuoteDuJour::Tags
  include Radiant::Taggable

  desc %{
    Renders a random quote from the quotes table (or if the id attribute is included,
    that specific quote).  If the id attribute is not present, and the author attribute is included,
    then the random quote will be selected from those available by that author.
    
    *Usage*:

    <pre><code><r:quote [id="quote_id" || author="author_name" all="true"] /></code></pre>
  }
  tag "quote" do |tag|
    if tag.attr['id']
      quote = Quote.find(tag.attr['id'])
    else
      if tag.attr['author']
        quotes = Quote.find_all_by_author(tag.attr['author'])
      else
        quotes = Quote.find(:all, :order => "author asc")
      end
      quote = quotes[rand(quotes.length)]
    end
    result = '<blockquote>' + quote.quote
    result << "<br /><br /><cite>&nbsp;&mdash;&nbsp;" + quote.author
    result << " in " + quote.work unless quote.work == ""
    result << '</cite></blockquote>'
    result
  end
  
  desc %{
    Renders all the quotes.  If the author attribute is included,
    then only the quotes from that author will be rendered.
    
    *Usage*:

    <pre><code><r:quotes [author="author_name"] /></code></pre>
  }
  tag "quotes" do |tag|
    if tag.attr['author']
      quotes = Quote.find_all_by_author(tag.attr['author'])
      result = "<h2>Quotes by #{tag.attr['author']}</h2>"
    else
      quotes = Quote.find(:all, :order => "author asc")
      result = "<h2>All Quotes</h2>"
    end
    quotes.each do |quote|
      result << '<blockquote>' + quote.quote
      result << "<br /><br /><cite>&nbsp;&mdash;&nbsp;" + quote.author
      result << " in " + quote.work unless quote.work == ""
      result << '</cite></blockquote>'
    end
    result
  end
  
end