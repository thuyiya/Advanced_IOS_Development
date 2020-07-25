
# Navigation System

[Ref: Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/app-architecture/navigation/)

### Let's try
1. How it work?
2. Basic Usage
3. Storyboard Navigation
4. Programmatic Navigation
5. Outcome 
	-   Take the user to another screen (view controllers) within your application
	-   Pass data between view controllers
	-   Create a navigation flow with or without a storyboard

### Exercise 
1. Limits and Cons of Xcode Storyboards?
2. Should I switch to Swift-driven navigation? 
3. So how do you stop using Storyboard and use Swift navigation?


How it work?
- 
A common way to manage a group of view controllers that are associated with a hierarchy of content is to use a  [`UINavigationController`](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UINavigationController_Class/index.html). Navigation controllers maintain a  [stack](http://en.wikipedia.org/wiki/Stack_%28abstract_data_type%29)  of view controllers that are pushed onto and popped off of the top of the stack as the user browses through the hierarchy. Their behavior is somewhat similar to that of a web browser's history and "back button" functionality.

The navigation controller is one example of a built-in UIKit  [container view controller](https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html). An in-depth guide by Apple covering navigation controllers and all other built-in container view controllers can be found  [here](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Introduction.html#//apple_ref/doc/uid/TP40011313-CH1-SW1).

Basic Usage
-
Most of the time navigation controller is the one that pass data between view controllers. The process for using navigation controllers in storyboard applications actually quite different than when using them programmatically since the concept of a _segue_ does not exist outside the storyboard.
- [Follow this artical to learn usage if navigation](https://guides.codepath.com/ios/Navigation-Controller#pushing-a-view-controller-onto-the-navigation-stack)

