# MovieSearch

## Description
Native iOS app built to search movies.

## Functionality
 This application is built using Swift 5 and Xcode 13.2 and it has 2 screens where the first screen has been designed to input the search parameters and the results are populated in a list.
 The second screen shows the list of searched results from where the user can re-search the movies.
 This app works in landscape and portrait modes of tablet and iphone, the searched results survive an app restart and is fetched back.
 
 ## Technologies 
 The app is based on VIPER architecture, the main reason for this was to make the app more scalable and easy to maintain, it also extensively uses protocols
 delegates, generics, extensions, singleton, codables for JSON parsing and Userdefaults.
 
 ## Future Scope of work
 The data displayed is very basic "Movie title", "Year of release", "Type" there are other API'S that can be consumed to enhance the details of results found
 like IMDB rating, movie description, Run time etc.
 UI enhancements with respect to display and fetching of saved results. 
 Currently we have used User defaults to save the searched results but going forward we can adopt to Core data for persistance storage of complex datas. 

