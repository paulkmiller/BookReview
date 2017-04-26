namespace :db do
  task bounce: :environment do
    puts "Starting Bounce"
    Rails.application.eager_load!

    begin
      %w(db:drop db:create db:migrate db:seed).each do |rake_task|
        puts " >>" * 20 + " #{rake_task} " + "<< " * 20
        Rake::Task[rake_task].invoke
      end
      puts "Bounce Complete"
    end
  end
end
