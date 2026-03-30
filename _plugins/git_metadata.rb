Jekyll::Hooks.register [:pages, :documents], :post_init do |doc|
  path = doc.path
  
  if path && File.exist?(path)
    # Fetch git history for this specific file
    # %ad: author date, %an: author name
    git_log = `git log --follow --format="%ad|%an" --date=iso-strict -- "#{path}" 2>/dev/null`.strip
    
    unless git_log.empty?
      logs = git_log.split("\n")
      
      # First commit (oldest) = creation date
      first_commit = logs.last.split('|')
      doc.data["created_at"] ||= first_commit.first
      
      # Last commit (newest) = last modified date
      last_commit = logs.first.split('|')
      doc.data["last_modified_date"] ||= last_commit.first
      
      # Current author (last modifying author)
      doc.data["author"] ||= last_commit.last
    end
  end
end
