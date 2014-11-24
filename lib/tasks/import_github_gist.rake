include ActionView::Helpers::TextHelper

desc 'Rake task to import github gist'
task import_github_gist: :environment do
  email = ENV['neember_email']
  if email.nil?
    puts 'Please supply a user email of Neember Gist to import to. eg. rake import_github_gist neember_email=abc@futureworkz.com github_username=abc'
    next
  end

  github_username = ENV['github_username']
  if github_username.nil?
    puts 'Please supply your Github username eg. rake import_github_gist neember_email=abc@futureworkz.com github_username=abc'
    next
  end

  user = User.where(email: email).first
  if user.nil?
    puts "No user found for #{email}" 
    next
  end

  user_id = user.id
  multiple_files = []
  import_counter = 0
  existing_snippets = Snippet.where(user_id: user_id).pluck(:title)

  response = HTTParty.get("https://api.github.com/users/#{github_username}/gists?per_page=100")
  gists = JSON.parse(response.body)

  gists.each do |gist|
    gist_title = gist['description']
    file = gist['files'].values.first

    if gist['files'].count > 1
      multiple_files << gist['description'] 
      next
    end

    if existing_snippets.include? gist_title
      puts "Skipping existing snippet for #{gist_title.blue}"
      next
    end

    gist_content = HTTParty.get(file['raw_url']).body
    print "Creating snippet for #{gist_title.blue}..."
    if Snippet.create(title: gist_title, content: gist_content, status: 'Personal', user_id: user_id)
      puts "success".green 
      import_counter += 1 
    else
      puts "failed".red
    end
  end

  if multiple_files.any?
    puts '====================================================='
    puts 'Multiple files in a gist are not imported for:'.red
    multiple_files.each { |file| puts "- #{file }".red }
  end

  puts '====================================================='
  puts "#{pluralize(import_counter, 'gist')} imported"
end
