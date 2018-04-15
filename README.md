# README

This is the website for Codeology at UC Berkeley.

Before getting started, make sure you're running the latest MacOS, installed all the security updates, and installed all XCode developer tools. (open XCode-->Preferences-->Locations-->Command Line Tools, select XCode; and then `xcode-select --install in Terminal`).

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