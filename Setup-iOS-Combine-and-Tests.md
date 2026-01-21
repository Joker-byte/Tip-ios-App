 1 
- New Xcode Project

- Install 3 Packages
Main Target:
      - https://github.com/CombineCommunity/CombineCocoa
      - https://github.com/SnapKit/SnapKit 

  Unit Test target:
       - https://github.com/CombineCommunity/CombineCocoa
       - https://github.com/pointfreeco/swift-snapshot-testing

  UITestTarget: 
       - https://github.com/CombineCommunity/CombineCocoa

  add Resources

 2 

  - Setup Root ViewController Programatically
    (
    1. Go to main storyboard and remove it - move to trash,
    2. under the Main Target 'Build Settings', at info.plist remove 
         -  | 'UIKit Main Storyboard File Base Name' : 'Main' | 
     then update 'Scene Delegate' to : 
        - remove all lifecycles methods except one : func scene ...
        - update a guard let _ = ... in --> 

         { ...
          guard let windowScene = (scene as? UIWindowScene) else {return}
                let window = UIWindow(windowScene: windowScene)
                let vc = ViewController()
                window.rootViewController = vc
                self.window = window
                window.makeKeyAndVisible()

        ... }
    <-- END
    3. In global info.plist remove key properties 'Storyboard Name' if present 
    )

 3 
  - Create High Level components with Layout 
  

 4 
  - Create theme constants
  - Colors
			- https://coolors.co/
               - https://coolors.co/palettes/trending 
			- https://stackoverflow.com/a/33397427/6181721 (Swift 5)

               
		- Fonts
             - https://developer.apple.com/fonts/system-fonts/ 
		- Set VC background colour

 5
	- Add logo view details 

 6 
    
     - Add ResultView

  7
    
     - Add AmountView
      
  8
    
     - Add bill Input View details    
     
  9
    
     - Add header View details   

  10
    
     - Add tip input View details   


 11 
   - add Slplit input view details

     - Duplicated project started now in part 2 (startWith: Clean up Views Lesson 12)      

 12 
   - Clean
////////    ----------    /////////

 26
    - Setup unit tests
        - write 1 test
            - $100 bill
            - no tip
            - 1 person

 27
    - Write more tests
        - testResultWithoutTipFor2Person
        - testResultWith10PercentTipFor2Person
        - testResultWithCustomTipFor4Person

 28
    - Test logo view double tap
        - sound played
        - calculator to reset

 29
    - Clean up test code


////////    ----------    /////////

30
   - Add image snapshot tests
      - unit tests for views
      - takes a master screenshot of a UI component and        compare against it during a tests

 31
   - Add snapshot test with custom values
      - https://stackoverflow.com/a/45297466/6181721


////////    ----------    /////////


 32
   - Add UI Tests
      - Test user interface - how screen elements interact with         the business logic
      - Write our first test- TestResultViewDefaultValues

 34
   - Add all identifiers

 35
   - Add all screen elements
   - https://www.hackingwithswift.com/articles/148/xcode-ui-testing-cheat-sheet

 36
   - Test regular tip flow
      - Bill $100, tip 10/15/20%, Split 4/2

 37
   - Test custom tip flow
   - Test reset