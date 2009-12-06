# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def tag_cloud(tags)
    classes = ['tag1', 'tag2', 'tag3', 'tag4', 'tag5']

    max, min = 0, 0
    tags.each do |t|
      max = t.users_count.to_i if t.users_count.to_i > max
      min = t.users_count.to_i if t.users_count.to_i < min
    end

    divisor = ((max - min) / classes.size) + 1

    tags.each { |t|
      yield t, classes[(t.users_count.to_i - min) / divisor]
    }
  end
  
  def login(text)
    link_to text, login_url, :method => :post
  end
  
  def image(user, options = {})
    image_tag "http://purl.org/net/spiurl/#{user.nickname}", options
  end
  
  def tags(user)
    user.tags.collect { |tag| link_to tag.name, tag }.join(' ')
  end
  
  def link_to_facebook(text)
    link_to text
  end
  
  def link_to_twitter(text)
    status = "You are a student coming to #leweb ? Start networking on http://lewebstudents.com #lewebstudents"
    link_to text, "http://twitter.com?status=#{CGI::escape(status)}"
  end
  
end
