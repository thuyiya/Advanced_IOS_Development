### UI and Unit Testing

* [ Summery. ](#summery)
    * [ How to use Xcode’s Test navigator to test an app’s model and asynchronous methods. ](#1)
    * [ How to fake interactions with library or system objects by using stubs and mocks. ](#2)
    * [ How to test UI and performance. ](#3)
    * [ How to use the code coverage tool. ](#4)
* [ What to Test. ](#whatis)
* [ Best Practices for Testing. ](#bestpractice)
* [ Unit Testing in Xcode. ](#unittesting)


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
Open the NIBM project and press Command-6 to open the Test navigator.

Click the + button in the lower-left corner, then select New Unit Test Target… from the menu:

<img src="https://koenig-media.raywenderlich.com/uploads/2016/12/TestNavigator1.png" alt="Kitten"
	title="A cute kitten" width="720" />

Accept the default name, NIBMTests. When the test bundle appears in the Test navigator, click to open the bundle in the editor. If the bundle doesn’t appear automatically, troubleshoot by clicking one of the other navigators, then return to the Test navigator.

<img src="https://koenig-media.raywenderlich.com/uploads/2016/12/TestNavigator2.png" alt="Kitten"
	title="A cute kitten" width="720" />

The default template imports the testing framework, XCTest, and defines a `NIBMTests` subclass of `XCTestCase`, with `setUp()`, `tearDown()`, and example test methods.

There are three ways to run the tests:

1. Product ▸ Test or Command-U. Both of these run all test classes.
1. Click the arrow button in the Test navigator.
1. Click the diamond button in the gutter.

<img src="https://koenig-media.raywenderlich.com/uploads/2016/12/TestNavigator3.png" alt="Kitten"
	title="A cute kitten" width="720" />