#!/bin/bash

if [[ $# -eq 0 ]] ; then
 	echo 'Usage: ruby_app.sh argument1, argument2, argument3, argumentn, ...'
	echo 'First argument - required, name of the ruby project e.g. cookbook'
	echo 'Sencond argument to n argument - optinal, name of the ruby app e.g. recipe'
	exit 0
fi

# Create root directory if does not exist
mkdir $1

# Populate root dir with files and folders 
main_dirs=('app' 'bin' 'config' 'db' 'lib' 'log' 'public' 'test' 'tmp' 'vendor')
main_files=('.gitignore' 'config.ru' 'Gemfile' 'Gemfile.lock' 'Rakefile' 'README.rdoc')

for i in "${main_dirs[@]}"
do
   mkdir -p  $1/$i
done

for i in "${main_files[@]}"
do
   touch  $1/$i
done

# Populate the app folder
app_folders=('assets' 'channels' 'controllers' 'helpers' 'jobs' 'mailers' 'models' 'views')

for i in "${app_folders[@]}"
do
   mkdir -p  $1/app/$i
done

mkdir -p $1/app/assets/config
mkdir -p $1/app/assets/images
mkdir -p $1/app/assets/javascripts
mkdir -p $1/app/assets/stylesheets/channels
touch $1/app/assets/config/manifest.js
touch $1/app/assets/config/application.js
touch $1/app/assets/config/cable.js

mkdir -p $1/app/channels/appliation_cable
touch $1/app/channels/appliation_cable/channel.rb
touch $1/app/channels/appliation_cable/connection.rb

mkdir -p $1/app/controllers/concerns
touch $1/app/controllers/concerns/application_controller.rb

touch $1/app/helpers/application_helper.rb

touch $1/app/jobs/application_job.rb

touch $1/app/mailers/application_mailer.rb

mkdir -p $1/app/models/concerns
touch $1/app/models/application_record.rb

mkdir -p $1/app/views/layouts
touch $1/app/views/layouts/application.html.erb
touch $1/app/views/layouts/mailer.html.erb
touch $1/app/views/layouts/mailer.text.erb

#Pupulate the bin folder
bin_files=('bundle' 'rails' 'rake' 'setup' 'spring' 'update' 'yarn')

for i in "${bin_files[@]}"
do
   touch  $1/bin/$i
done

#Populate the config folder
config_files=('applicaton.rb' 'boot.rb' 'cable.yml' 'database.yml' 'enviroment.rb' 'puma.rb' 'routes.rb' 'secrets.yml' 'spring.rb')

for i in "${config_files[@]}"
do
   touch  $1/config/$i
done

#Populate the db folder
touch $1/db/seeds.rb

#Populate the lib folder

mkdir -p $1/lib/assets
mkdir -p $1/lib/taks

#Populate the public folder
public_files=('404.html' '422.html' '500.html' 'd.png' 'favicon-ico' 'robots.txt')

for i in "${public_files[@]}"
do
   touch  $1/public/$i
done

#Populate the test folder
public_folders=('controllers' 'fixtures' 'helpers' 'integration' 'mailers' 'models' 'system')

for i in "${public_folders[@]}"
do
   mkdir -p  $1/test/$i
done

touch $1/test/application_system_test_case.rb
touch $1/test/test_helper.rb

#Populate the tmp folder

mkdir -p $1/tmp/cache/assets

echo "Project created"

# Create apps if optional arguments send
if [ $2 ] 
then

view_files=('index.html.erb' 'edit.html.erb' 'show.html.erb' 'new.html.erb' '_form.html.erb' 'index.json.jbuilder' 'show.json.jbuilder')
# Each iteration for each app
for ((i = 2; i <= $#; i++ ))
do	
	mkdir -p $1/app/views/${!i}
	touch $1/db/create_${!i}.rb
	touch $1/app/models/${!i}.rb
	touch $1/test/models/${!i}_test.rb
	touch $1/test/fixtures/${!i}.yml
	touch $1/app/controllers/${!i}_controller.rb
	touch $1/app/helpers/${!i}_helper.rb
	touch $1/app/assets/javascripts/${!i}.coffe
	touch $1/app/assets/stylesheets/${!i}.css
	touch $1/app/assets/stylesheets/${!i}.scss
	
	#Populate views app directory for every app
	for j in "${view_files[@]}"
	do
   		touch  $1/app/views/${!i}/$j
	done
	echo "App ${!i} created"
done
fi


