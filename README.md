# UserSetup

- Project has iOS 14 as minimum iOS version.
- I used MVVM pattern. Each view controller(UIViewController) has view model. 
  View controller contains UI logic, view model contains business logic. View models can be covered by unit tests.
- All strings are placed in Localizable.strings
- All Images are placed in Images.xcassets
- All colors are placed in Colors.xcassets. It enable to change colors here for Light/Dark scheme.
- User height is a constant because Height screen is absent (heightInMeters = 1.7) 

# Architecture notes
- All data entered by the user is accumulated in the User class which is stored in the UserDefaults.
- Each screen first loads user data (User) and saves it before navigating to the next screen.

# Not finished
- Use Localizable.stringsdict for plural forms (pound/pounds, kilogam/kilograms)
- Keyboard processing (show/hide scrolling)
- Writing unit tests for view models
- Use HealthKit for getting Weight/ DOB/ Height:
   * Add HealthKit capability
   * Use HKHealthStore class
   * Check if HealthKit available on the device:
```
       HKHealthStore.isHealthDataAvailable()
```
   * healthStore.requestAuthorization(), process error
   * Get date of birth:
```
       let dateOfBirth = try healthStore.dateOfBirthComponents()
```
   * Get gender:
```
       let gender = try healthStore.biologicalSex()
```
   * Get weight, process error:
```
       let weightType = HKSampleType.quantityType (forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
       let queryWeight = HKSampleQuery(sampleType: weightType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil)
```
   * Get height, process error:
```
       let heightType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!
       let queryHeight = HKSampleQuery(sampleType: heightType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil)
```


