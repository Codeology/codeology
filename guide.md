### Updating people

Simply update`People.rb` in the `app/models` folder. People are grouped into three lists of dictionaries: `leadership`, `members`, and `alumni`.
The dictionary structure is as follows:
```
{:name => "<First Last>", :title => "<title>", :imgurl => "people/<name>.jpg"}
```

The other change you must do is put a copy of that person's photo into the `app/assets/images/people` folder. The name of the image should be the same as the name you put in `People.rb`.
