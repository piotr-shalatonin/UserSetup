# UserSetup

- Project has iOS 14 as minimum iOS version.
- I used MVVM pattern. Each view controller(UIViewController) has view model. 
  View controller contains UI logic, view model contains business logic.
- All strings moved to Localizable.strings
- All Images moved to Images.xcassets
- All colors moved to Colors.xcassets. It enable to change colors here for Light/Dark scheme
- User height is a constant because Height screen is absent (heightInMeters = 1.7) 

# Not finished
- Use Localizable.stringsdict for plural forms (pound/pounds, kilogam/kilograms)
- Keyboard processing (show/hide scrolling)
- Use HealthKit for getting Weight/ DOB/ Height
- Writing unit tests for view models