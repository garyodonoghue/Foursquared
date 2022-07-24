# Foursquared
iOS application (using SwiftUI) which shows a number of venues around a user's location using the Foursquare API

## Getting Started
- Open `Foursquared.xcworkspace` (workspace is used due to the use of the Cocoapods `Cuckoo` dependency which for mocking in the unit tests)
- There is an API key placeholder in Constants.swift. You'll need to swap this with an API key generated from creating a Foursquare developer account

## Notes
- The app is written using SwiftUI and uses async/await for asynchronous code
- All unit tests are located within the FoursquaredTests target
- The Foursquare API specific types and integration code is located within the `Foursquare` folder, to make it clear that it's a separate dependency
- Interaction with the API is done through the ViewModels, each View has an associated ViewModel where it makes sense
- The service calls are invoked from the ViewModels through the use of a `PlacesServiceProtocol`, which resides outside the `Foursquare` specific folder. 
- This separation would allow another 3rd party places provider to be swapped out for Foursquare, and the app would continue to function as normal without any changes necessary 
to the View/ViewModel classes, as long as that implementation conformed still to that same protocol
- I tried to keep separation of concerns as much as possible, i.e. ViewModels handle presentation logic, service/api handles all requests/parsing to models. This also means I  dont include any SwiftUI / UIKit imports in the Models/Services class, so that if it ever needed to be swapped out for a different UI framework that would be possible  
- I added an app specific `FoursquaredSessionProtocol`, and `URLSession` is then made conform to that, which allows mocking of the API requests in `PlacePlacesServiceTests`

## Gaps / Further improvements
- Due to time constraints, there is very limited error specific UI code. i.e service errors are just printed to console, whereas an error dialog would have been nicer
- The `CLLocationManagerDelegate` logic in `PlacesListViewModel` is quite crude. If a user changes their location, it will fire a new request to fetch nearby places, if a person is moving a lot this could be quite a lot of resources used, maybe there should be logic here to only make requests when a certain distance threshold has been crossed, i.e. 100m or so, or cache a slightly larger set of places than is actually within the target radius, and use this to 'lazily load' new places without making new API requests
- I matched the data structure of the foursquare API, but maybe some things are more suited in different models, e.g `categoryImages` resides within `Place` model, but it is not shown until you go into the Detail page, so it would probably be better placed in `PlaceDetail`, shouldnt let the Foursquare structure govern the structure of our app domain, since this API could change potentially for another in future

## Nice to haves
- More detailed PlaceDetail page, some places dont have a lot of info coming back and they can look quite bare
- Show place on map - a button on the detail page to show the location on the map related to the user's position might be a nice visual which people are already familiar with 
- Favouriting a place - would be nice to be able to favourite specific places, store these favourites in CoreData etc, so could support some minimal offline functionality
- Snapshot tests for testing the views
- Location settings prompt - there is only a single prompt for location permission, and if you deny location permission to the application, there is no retry logic, or prompt to go to the app Setttings to enable location, so this is quite limited. Would be nice to show an alert informing the user they need to enable location permission, with a link to the app settings page
