### Deploying to heroku

To have your changes reflected on the website you **must** git push to heroku's git repo.

To do this, you must have a heroku account and that account must be on the collaborator's list on the codeology web app. You also need to download, install, and log in with heroku's CLI (command line interface). This will allow you to `git push heroku master`. Or you can push from another branch if you do not want to push from your local master: `git push heroku branch:master`. Make sure you also push to the `codeology` github so that future contributors don't get version control issues. Rebasing is a double edged sword-it can get gnarly!

### Updating people

Simply update`People.rb` in the `app/models` folder. People are grouped into three lists of dictionaries: `leadership`, `members`, and `alumni`.
The dictionary structure is as follows:
```
{:name => "<First Last>", :title => "<title>", :imgurl => "people/<name>.jpg"}
```

The other change you must do is put a copy of that person's photo into the `app/assets/images/people` folder. The name of the image should be the same as the name you put in `People.rb`.
