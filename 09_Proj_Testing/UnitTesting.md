1. create project `nibmdevelopmentone`
2. this time remember to tick the 'Include Unit Test'
3. there will be file call `nibmdevelopmentoneTests` under nibmdevelopmentoneTests folder
4. make it like this
```swift
import XCTest
@testable import nibmdevelopmentone

class nibmdevelopmentoneTests: XCTestCase {


}
```

5. Now lets create some functionalities
6. click on the root and crate new file call Calculation.swift
7. now lets create some function
```swift
class Calculation {
    func addNumbers(x: Int, y: Int) -> Int{
        return x + y
    }
    
    func mutipleNumbers(x: Int, y: Int) -> Int{
        return x * y
    }
    
    func divideNumers(x: Int, y: Int) -> Int{
        return x/y
    }
}

```
8. now lets write test for these, that mean those function should do what we expected to do. So if somebody change the function if its faild to achive the expected value that mean its faling.
9. so lets write some tests
10. now you can write test inside of the test file. but remember. we have to start all function with `test` thats how test bed identifying it as test function
11. inside `nibmdevelopmentoneTests`
```swift
import XCTest
@testable import nibmdevelopmentone

class nibmdevelopmentoneTests: XCTestCase {

    func testAddMath() {
        let math = Calculation()
        
        let result = math.addNumbers(x: 1, y: 2)
        
        XCTAssertEqual(result, 3)
    }
}

```

12. so, `XCTAssert` is one of a family of asserts for unit testing from the `XCTest` framework, and should only be present in Unit Test Targets (i.e. not in your application code). If the assert fails, it does not terminate the execution of the test harness or hosting application, but records and reports the failure.

Unit test assertions are recorded and reported during the "Test" action (compare to "Run" and "Install" actions
13. lets check others
```swift
class nibmdevelopmentoneTests: XCTestCase {

    func testAddMath() {
        let math = Calculation()
        
        let result = math.addNumbers(x: 1, y: 2)
        
        XCTAssertEqual(result, 3)
    }
    
    func testMutipleMath() {
        let math = Calculation()
        
        let result = math.mutipleNumbers(x: 1, y: 2)
        
        XCTAssertEqual(result, 2)
    }
    
    func testDivideMath() {
        let math = Calculation()
        
        let result = math.divideNumers(x: 2, y: 2)
        
        XCTAssertEqual(result, 1)
    }
}
```
