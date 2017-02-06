AdminUser.create!(email: 'admin@encoredevlabs.com', password: 'password', password_confirmation: 'password')
['Raking Lawn', 'Snow Shoveling', 'Mowing Lawn'].each do |job|
  JobType.create!(name: job)
end
