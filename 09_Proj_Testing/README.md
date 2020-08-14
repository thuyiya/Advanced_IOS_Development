### UI and Unit Testing

* [ Summery. ](#summery)
    * [ How to use Xcode’s Test navigator to test an app’s model and asynchronous methods. ](#1)
    * [ How to fake interactions with library or system objects by using stubs and mocks. ](#2)
    * [ How to test UI and performance. ](#3)
    * [ How to use the code coverage tool. ](#4)
* [ What to Test. ](#whatis)
* [ Best Practices for Testing. ](#bestpractice)
* [ Unit Testing in Xcode. ](#unittesting)
* [ Using XCTAssert to Test Models. ](#fristtest)


#### What to Test

Before writing any tests, it’s important to know the basics. What do you need to test?

If your goal is to extend an existing app, you should first write tests for any component you plan to change.

Generally, tests should cover:

 - Core functionality: Model classes and methods and their interactions with the controller
 - The most common UI workflows
 - Boundary conditions
 - Bug fixes

#### Best Practices for Testing

The acronym FIRST describes a concise set of criteria for effective unit tests. Those criteria are:

 - Fast: Tests should run quickly.
 - Independent/Isolated: Tests should not share state with each other.
 - Repeatable: You should obtain the same results every time you run a test. External data providers or concurrency issues  could cause intermittent failures.
 - Self-validating: Tests should be fully automated. The output should be either “pass” or “fail”, rather than rely on a programmer’s interpretation of a log file.
 - Timely: Ideally, tests should be written before you write the production code they test (Test-Driven Development).

#### Unit Testing in Xcode

Creating a Unit Test Target
Open the BullsEye project and press Command-6 to open the Test navigator.

Click the + button in the lower-left corner, then select New Unit Test Target… from the menu:

<img src="https://koenig-media.raywenderlich.com/uploads/2016/12/TestNavigator1.png" alt="Kitten"
	title="A cute kitten" width="320" />

Accept the default name, BullsEyeTests. When the test bundle appears in the Test navigator, click to open the bundle in the editor. If the bundle doesn’t appear automatically, troubleshoot by clicking one of the other navigators, then return to the Test navigator.

<img src="https://koenig-media.raywenderlich.com/uploads/2016/12/TestNavigator2.png" alt="Kitten"
	title="A cute kitten" width="720" />

The default template imports the testing framework, XCTest, and defines a `BullsEyeTests` subclass of `XCTestCase`, with `setUp()`, `tearDown()`, and example test methods.

There are three ways to run the tests:

1. Product ▸ Test or Command-U. Both of these run all test classes.
1. Click the arrow button in the Test navigator.
1. Click the diamond button in the gutter.

<img src="https://koenig-media.raywenderlich.com/uploads/2016/12/TestNavigator3.png" alt="Kitten"
	title="A cute kitten" width="320" />

You can also run an individual test method by clicking its diamond, either in the Test navigator or in the gutter.

Try the different ways to run tests to get a feeling for how long it takes and what it looks like. The sample tests don’t do anything yet, so they run really fast!

When all the tests succeed, the diamonds will turn green and show check marks. You can click the gray diamond at the end of `testPerformanceExample()` to open the Performance Result:

<img src="https://koenig-media.raywenderlich.com/uploads/2016/12/TestNavigator4.png" alt="Kitten"
	title="A cute kitten" width="720" />

You don’t need `testPerformanceExample()` or `testExample()` for this tutorial, so delete them.

#### Using XCTAssert to Test Models

First, you’ll use XCTAssert functions to test a core function of BullsEye’s model: Does a BullsEyeGame object correctly calculate the score for a round?

In `BullsEyeTests.swift`, add this line just below the `import` statement:

```swift
@testable import BullsEye
```

This gives the unit tests access to the internal types and functions in BullsEye.

At the top of the BullsEyeTests class, add this property:


```swift
var sut: BullsEyeGame!
```
This creates a placeholder for a BullsEyeGame, which is the System Under Test (SUT), or the object this test case class is concerned with testing.

Next, replace the contents of setup() with this:

```swift
super.setUp()
sut = BullsEyeGame()
sut.startNewGame()
```

This creates a BullsEyeGame object at the class level, so all the tests in this test class can access the SUT object’s properties and methods.

Here, you also call the game’s startNewGame(), which initializes the targetValue. Many of the tests will use targetValue to test that the game calculates the score correctly.

Before you forget, release your SUT object in tearDown(). Replace its contents with:

```swift
sut = nil
super.tearDown()
```

Lets write your first test code...