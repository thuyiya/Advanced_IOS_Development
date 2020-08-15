1. download the basic music app project
2. Lets genrate the uitest target
3. Click on the project root, under Genaral you can see the Project and the Target
4. Click the plus button below the Target area
5. Then scroll down till you see the UITesting Bundle
6. Then click next and finish. you do not need to edit anything else
7. Now if see the project files, you can see its genarate <Project Name>UITests file
8. You can test project as run target. `New Scheme` -> `Ok` Now you can select the new target and run the project
9. UI testing is about correct recording of the preocess, So when you recode your project, remember to selct the project scheme from target build.
10. then create the test example 
```swift
func testExample() throws {
        // UI tests must launch the application that they test.
        
        let validPassword = "123456"
        let validUsername = "nibm"
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["NIBM Music"].buttons["Profile"].tap()
        
        
        let userNameTextField = app.textFields["Username"]
        XCTAssertTrue(userNameTextField.exists)
        
        userNameTextField.tap()
        
        userNameTextField.typeText(validUsername)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        app.buttons["Login"].tap()
        
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
```
11.  It will not work because we need to give wating time
```swift
let validPassword = "123456"
        let validUsername = "nibm"
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["NIBM Music"].buttons["Profile"].tap()
        
        
        let userNameTextField = app.textFields["Username"]
        XCTAssertTrue(userNameTextField.exists)
        
        userNameTextField.tap()
        
        userNameTextField.typeText(validUsername)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        app.buttons["Login"].tap()
        
        let downloadCell = app.tables.staticTexts["My Downloads"]
        
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: downloadCell, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
```