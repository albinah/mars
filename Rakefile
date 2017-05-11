require 'mars'
require 'rake/testtask'

task :run do
  Mars::Runner.new.run 'source_data'
end

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/**/*_test.rb']
end
