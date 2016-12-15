# _Recipe Application_

#### _A web application to save Recipes, Categories, and Ingredients. Exercise to practice many to many database relationships though use of Active Record, Ruby, Sinatra; week four of Epicodus Ruby, 12/15/2016_

#### By _**Tracie Weitzman and Jonathan Thom**_

## Specifications

#### 1. Adds Recipes and Saves them to a Database
* Input: Burrito
* Output: Show link for recipe page

#### 2. Adds Categories and Saves them to a Database
* Input: Mexican
* Output: Show link for category page

#### 3. Adds Ingredients and Saves them to a Database
* Input: Carne Asada
* Output: Show link for ingredient page

#### 4. Visit Recipe Page, edit name and instructions, add categories, add ingredients, add rating, and delete Recipe

#### 5. Visit Category Page, edit name, add recipes, and delete Category

#### 6. Visit Ingredient Page, edit name, add recipes, and delete Ingredient

#### 7. Sort Recipes by Rating
* Input: 1, 3, 2
* Output: 3, 2, 1

## Database Schema

![alt tag](https://raw.githubusercontent.com/JonathanWThom/recipes/master/public/img/schema)

## Setup/Installation Requirements

_Works in any web browser. To run Recipe Application, in command line run:_

```
$ git clone https://github.com/weitzwoman/recipes_ruby
$ cd recipes_ruby
$ postgres
$ bundle
$ rake db:create
$ bundle exec rake db:migrate
$ rake db:test:prepare
$ ruby app.rb
```

## Support and contact details

_Contact us on Github at [weitzwoman](https://github.com/weitzwoman) and [JonathanWThom](https://github.com/JonathanWThom)_

## Technologies Used

* _HTML_
* _CSS_
  * _Bootstrap_
* _Ruby_
  * _Sinatra_
* _ActiveRecord_


### License

Recipe App is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Recipe App is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the Recipe App. If not, see http://www.gnu.org/licenses/.

Copyright (c) 2016 **_Tracie Weitzman and Jonathan Thom_**
