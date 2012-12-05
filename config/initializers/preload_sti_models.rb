if Rails.env.development?
  %w[user student teacher administrator].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end