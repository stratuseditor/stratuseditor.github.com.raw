# Be sure to set the following in the `_config.yml`.
# 
#   markdown: rdiscount
#   rdiscount:
#     extensions: [generate_toc]
# 
# 
module Jekyll
  class MarkdownConverter
    def convert(content)
      setup
      rd  = RDiscount.new(content, *@rdiscount_extensions)
      toc = %(<nav class="table-of-contents">
          #{rd.toc_content}
        </nav>)
      return rd.to_html + toc
    end
  end
end
