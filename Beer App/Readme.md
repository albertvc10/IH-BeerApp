#BEER APP

##Beers Objective

###Create the foundations of our Beer app

##Beer info

Create a class designed to hold basic Beer info: - name (text) - country of origin (text) - alcoholic grade (number) - url to photo (text)

Every beer in our system must have at least a name. You cannot create a beer without a name. Write init:
Bonus: add some more init methods

##Test, test, test

test Beer class creation
test Beer class inits
test Beer properties, using dot notation & KVC

##Beers collection class

Create new Beers class, with method allBeers return a list of Beers you read from a plist file test the allBeers method
Design the interface
Delete your storyboard
Add an UITableViewController (BeersViewController) with XIB file
Make it the rootViewController of the UIWindow
Add the required delegate methods
Add a property to inject all Beers to BeersViewController using dependency injection. create the model object in AppDelegate, inject to BeersViewController
Fill in table view

##Show all Beers

```
￼￼￼initWithName:
```

￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼
##Add row touched

When you tap a row, a message is shown on console showing: row tapped & beer name