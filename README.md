# README
This is the website for the Codeology club at Berkeley

## Design Documents

* [Hao: Interview Matching System](doc/interviewMatchingSystem.md)

## MacOS setup

Before getting started, make sure you're running the latest MacOS, installed all the security updates, and installed all XCode developer tools.

If you do not have Ruby on Rails on your system, please follow the instructions at [installrails.com](http://www.installrails.com).

Check out this repository to your local workspace ([GitHub for Mac](http://mac.github.com/) is recommended, or simply use `git clone`).

Next, [install rbenv](https://github.com/sstephenson/rbenv#installation) and
[add ruby-build](https://github.com/sstephenson/ruby-build#installation) to
manage your Ruby versions and gems:

```
rbenv install 2.2.2
rbenv local 2.2.2
gem install bundler
```

You'll also need to have [Homebrew](http://brew.sh/) and MySQL installed
([This can be tricky on Mac OS X](http://stackoverflow.com/a/11945530/549397))
because it's a dependency for the `mysql2` gem:

```
brew install mysql
```

Finally, install the gems necessary for development, testing, and deployment:

```
bundle install
```

If you run into an error with incompatible Ruby Versions, check [here](https://stackoverflow.com/questions/37619964/bundle-install-not-using-rbenv-local-ruby-version) and see if you need to update your ~/.bash_profile 's PATH accordingly).

If you have trouble installing libv8 on El Capitan, see [here](http://stackoverflow.com/questions/19577759/installing-libv8-gem-on-os-x-10-9).

<<<<<<< 7d8ffa7bf36a242dab48eac27f4faa5ca0bc0efc
Make sure to run
```
rake db:setup
```
to initialize the website's internal database.

When developing on local, you need to instantiate a PG server instance in order to run Cucumber tests and start Rails on your local environment. The typical way to do this on Mac OS X is through
```
initdb /usr/local/var/postgres -E utf8
```
if you need to initialize a PG server instance, and 
```
pg_ctl -D /usr/local/var/postgres -l logfile start

```
to start the server.

## Windows Setup

You will need to install these:
* **A Ruby Installer** You can find ruby-installer [here](https://rubyinstaller.org/downloads/archives/). We are using Ruby 2.2.2. Make sure you select the appropriate version (32 vs. 64 bit).
* **A Ruby Manager** You can find chruby [here](https://github.com/postmodern/chruby#readme) (the sibling to ruby-install). Chruby allows you to switch between multiple Rubies (Ruby Versions).
* **A Gem Manager** You can find bundler [here](http://bundler.io/). Bundler makes managing gems (Ruby packages) easier for your projects. (gem install bundler)
* **Rails** Run `gem install rails`
* **PostgreSQL** which can be found [here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows). Make sure you select the appropriate version to your OS (32 vs. 64 bit).
* **Ruby for VSCode** (If you use VSC) Visual Studio Code has a package that has Ruby language and debugging support [here](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby).

### Database:
* These steps are necessary for you to run `rails server` to start up a local server for you to test/develop on.
* After installing PostgreSQL, open pgAdmin (comes with installation) and create the databases listed in the `database.yml` file. Currently the dev database should be: "db/development" (the slash is part of the name)
* You will also need to modify the `database.yml` file by adding: `host: ""` `username: username` `password: password` in the `default` block where username and passwords are what you set during installation of PostgreSQL. A detailed explanation of why we use `host: ""` can be found [here](https://stackoverflow.com/questions/23375740/pgconnectionbad-fe-sendauth-no-password-supplied).
* If you plan on making changes to the database make sure you read up on [migrations](http://guides.rubyonrails.org/v3.2/migrations.html) before doing so.
### Issues
* If you get an SSL Error you will need to update certificates: [download and install most current gem](https://rubygems.org/gems/rubygems-update)
  - gem install rubygems-update-x.x.x.gem (make sure you cd into wherever you downloaded the gem for this command)
  - update_rubygems
  - gem update --system
* You might need to download the devkit [here](https://rubyinstaller.org/downloads/) and follow quick start instructions [here](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)

## Additional Resources
* Skimming [getting started with rails](https://www.pluralsight.com/blog/software-development/tutorial-rails) can be helpful if you want a quick intro to the framework. Recommended if you have little/no experience with rails.

## Windows Setup

You will need to install these:
* **A Ruby Installer** You can find ruby-installer [here](https://rubyinstaller.org/downloads/archives/). We are using Ruby 2.2.2. Make sure you select the appropriate version (32 vs. 64 bit).
* **A Ruby Manager** You can find chruby [here](https://github.com/postmodern/chruby#readme) (the sibling to ruby-install). Chruby allows you to switch between multiple Rubies (Ruby Versions).
* **A Gem Manager** You can find bundler [here](http://bundler.io/). Bundler makes managing gems (Ruby packages) easier for your projects. (gem install bundler)
* **Rails** Run `gem install rails`
* **PostgreSQL** which can be found [here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows). Make sure you select the appropriate version to your OS (32 vs. 64 bit).
* **Ruby for VSCode** (If you use VSC) Visual Studio Code has a package that has Ruby language and debugging support [here](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby).