## Taxi App
#### Taxi app using firebase without storyboard

* [ Auth UI. ](#authui)
* [ Setup Firebase. ](#firebase)
    * [ Setting up Your Firebase Account ](#fstep1)
    * [ Adding Firebase Pods Dependencies to Your App ](#fstep2)
* [ Create Users. ](#createusers)
* [ Home Controler. ](#apphome)
* [ Map Kit. ](#mapkit)
    * [ Configure Map Kit. ](#mapkit)
    * [ Setup User Location Services. ](#userlocationservices)
    * [ Location input user interface. ](#locationinputuserinterface)
    * [ Location Input View. ](#locationinputview)
    * [ Fetch user data with firebase. ](#fetchuserdatawithfirebase)
    * [ Get Nearby Drivers. ](#nearbydrivers)
    * [ Drivers on map. ](#diplaydriversonmap)
    * [ Updaet driver position real time. ](#updaetdriverpositionrealtime)
    * [ Search and Display Location. ](#searchanddisplay)

<a name="authui"/>

### Login And Registation UI

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/signin.png" alt="Kitten"
	title="A cute kitten" width="240" />

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/signup.png" alt="Kitten"
	title="A cute kitten" width="240" />

1. create sigle view application
2. Create 5 group folders in project root clicking on project root foler 'New Group'
3. Name them as Model, View, Controller, Service and Utils
4. Remove the ViewControler file and lets create our login and signup view controller files
5. Remove the SenceDelegate file and Main storyboard and remove main storyboard referance from Project genaral settings
6. Navigate back to pList and remove any key related Main storyboard and remove "Application Scene Manifest" also 
7. Now create your LoginViewController class. Right click on Controller folder create new swift file
```swift
import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
```
8. Go to loginviewcontroller and set the background color red and check its working or not
```swift
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }

}
```
9. Lets setup our login screen
10. For esay navigation you can create MARK comment on top of every section in your code
```swift
class LoginViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Lifecycale

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }

}
```
11. This is screen that we going to build
12. Lets create our title lable
```swift
// MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "NTAXI"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        
        return label
    }()
```
13. and lets make translatesAutoresizingMaskIntoConstraints false to see our lable in the view `titleLabel.translatesAutoresizingMaskIntoConstraints = false`
14. then lets center it to the view `titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true`
15. Let add this titlelabel to our view `view.addSubview(titleLabel)` and change the colors
```swift
...
// MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "NTAXI"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        return label
    }()
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    }
    ...
```
16. Lets create extentions for uis - common uiview handller to organize all view related code
17. 
```swift
import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                height: CGFloat? = nil,
                width: CGFloat? = nil
    ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
```
18. lets use our extention and lets re postion our title label view
```swift
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
    }

```
19. Lest create the login fields and the button
20. First of all grab the asset folder and drop on assert
21. lets create Container View for email
```swift
private let emailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
```
22. then create text field for it
```swift
    private let emailTextFiled: UIView = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return tf
    }()
```
23. lets create image view for hold the image
```swift
    private let emailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        
        return view
    }()

```
24.  now lets add this to our view and check is it working or not
```swift
...

view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16, height: 50)

...
```
25. lets make centerY for our extention
```swift
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
```
26. Then lets add the image to email container
```swift
...
        let view = UIView()
        view.backgroundColor = .red
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        return view

...
```
27. now lets add our textfield to it
```swift
view.addSubview(emailTextFiled)
        emailTextFiled.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
```
28. then you will get error like `Instance member 'emailTextFiled' cannot be used on type 'LoginViewController'; did you mean to use a value of this type instead?` That because textfield varibale is out side of email let, so we can fix this by adding make it lazy
29. 
```swift
private lazy var emailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        view.addSubview(emailTextFiled)
        imageView.centerY(inView: view)
        emailTextFiled.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        return view
    }()
```
30. now lets add the separator 
```swift
private lazy var emailContainerView: UIView = {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        view.addSubview(emailTextFiled)
        emailTextFiled.centerY(inView: view)
        emailTextFiled.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }()
```
31. lets add password containerView
```swift
...

private lazy var passwordContainerView: UIView = {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        view.addSubview(passwordTextFiled)
        passwordTextFiled.centerY(inView: view)
        passwordTextFiled.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }()
    ...

    private let passwordTextFiled: UIView = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return tf
    }()
    ...

    view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 50)
        
    ...
```
32. But we are repeating same kind code over and over again, se lets refactor our code little bit. Lets add most our ui code to extentions

##### Code Refactor

```swift

extension UITextField {
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) -> UITextField{
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return tf
    }
}

```
33. lets call it in login controller
```swift
...
private let emailTextFiled: UIView = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextFiled: UIView = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
...
```
34. let create extention for input container
```swift

extension UIView {
    
    func inputContainerView(image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        view.addSubview(textField)
        textField.centerY(inView: view)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }

    ...
```
35. lets call it inside of controller
```swift
...

private lazy var emailContainerView: UIView = {
        return UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled as! UITextField)
    }()
    
    private lazy var passwordContainerView: UIView = {
        return UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled as! UITextField)
    }()

...
```
36. now we have to make this ui render in all device. let use stack view to make it happen. For that we need vertical stack. when you work with vertical stack we have to give height to our view containers first
```swift
private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled as! UITextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled as! UITextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
```
37. then lets add it to stack view
```swift
...

let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)

...
```
38. create login button
```swift
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }()

```
39. lets add that to our stack view
```swift
...
let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
...
```
40. Lets create uicolor extention for our rgb colors
```swift
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha!)
    }
    
    static let backgroundColor = rgb(red: 25, green: 25, blue: 25)
    static let mainBlueTint = rgb(red: 17, green: 154, blue: 237)
}

```
41. create dont Have Account Button
```swift
...
let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
...

view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)

...
```
42. Lets add action handler to our dontHaveAccount button `button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)`
43. then lets create this handleShowSignUp function
```swift
@objc func handleShowSignUp() {
        
    }
```
44. Now we have to create signup view controller. When some one click on signup button we going to navigate to signup view controller
```swift
import UIKit

class SignUpViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Selectors
}

```
45. lets navigate to that controller
```swift
...

@objc func handleShowSignUp() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

```
46. now if you run this nothing will happen with thi function, that because our root view controller is not a navigation view controller. then lets add navigation behaviour to our root view controller (login view). Lets go to the AppDelegate
```swift
...
window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
```
48. if you make navigation barstyle as black you no need to make status bar color in light mode so you can remove that function
```swift
override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
```
49. Lest remove the navigation bar
```swift
...
// MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleShowSignUp() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helper Function
    
    func configureUI() {
        
        configureNavigationBar()
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
```
50.  lets create our sign up view controller
```swift
//
//  SignUpViewController.swift
//  NibmTaxi
//
//  Created by thusitha on 8/8/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "NTAXI"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled as! UITextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var fullNameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullNameTextFiled as! UITextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled as! UITextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    
    private let emailTextFiled: UIView = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let fullNameTextFiled: UIView = {
        return UITextField().textField(withPlaceholder: "Full Name", isSecureTextEntry: false)
    }()
    
    private let passwordTextFiled: UIView = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helper Function
    
    func configureUI() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, fullNameContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
    }
}

```
51. Then lets create segment controller for select type for the user. for that we have to update our inputContainerView with segment view parameter
```swift
...
 func inputContainerView(image: UIImage, textField: UITextField? = nil, segentedControl: UISegmentedControl? = nil) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        
        if let textField = textField {
            imageView.centerY(inView: view)
            imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
            
            view.addSubview(textField)
            textField.centerY(inView: view)
            textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        }
        
        if let segentedControl = segentedControl {
            imageView.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: -8, paddingLeft: 8, width: 24, height: 24)
            
            view.addSubview(segentedControl)
            segentedControl.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 8, paddingRight: 8)
            segentedControl.centerY(inView: view, constant: 8)
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }
    ...

    func centerY(inView view: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }

    ....
```
52. Now create segemnt controller in signup view controller
```swift
...

private lazy var accountTypeContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), segentedControl: accountTypeSegmentedControl)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
...

private let accountTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Rider", "Driver"])
        sc.backgroundColor = .backgroundColor
        sc.tintColor = UIColor(white: 1, alpha: 0.87)
        sc.selectedSegmentIndex = 0
        
        return sc
    }()

    ...
```
53. lets add that to the our stack view
```swift

...
let stack = UIStackView(arrangedSubviews: [emailContainerView, fullNameContainerView, passwordContainerView, accountTypeContainerView, signUpButton])

...

```
54. now create our sign up button, for that lets create common sub class for all auth buttons. create class inside vide folder name it as AuthButtonUIButton
```swift
import UIKit

class AuthButtonUIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        backgroundColor = .mainBlueTint
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("AuthButtonUIButton coder error")
    }
}

```
55. lets add to sign up controller
```swift
private let signUpButton: AuthButtonUIButton = {
        let button = AuthButtonUIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()

...
let stack = UIStackView(arrangedSubviews: [emailContainerView, fullNameContainerView, passwordContainerView, accountTypeContainerView, signUpButton])

...
```
56. lets create navigation back button to login screen `alreadyHaveAccountButton`
```swift
...
let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
...
...
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        
    }
    
    // MARK: - Selectors
    
    @objc func handleShowLogIn() {
        navigationController?.popViewController(animated: true)
    }

...
```

<a name="firebase"/>

### Setup Firebase

<a name="fstep1"/>

#### Setting up Your Firebase Account

Head over to Firebase Console and create a new project (name it as you wish). Once you’ve created a new Firebase project, go to its Firebase Dashboard, by simply clicking on it in Firebase. You should be landing on this screen:

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/step1.png" alt="Kitten"
	title="A cute kitten" width="720" />

Below the centered title, press on the “Add app” button and add a new iOS app to your project. For the bundle ID, you can use “io.instamobile.FirebaseStarterApp“, which is the Bundle ID of our starter project. If you’d prefer to use your own bundle ID, make sure you update the Bundle Identifier in Xcode (“General” tab of the FirebaseStarterApp build target)

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/step2.png" alt="Kitten"
	title="A cute kitten" width="420" />

Once registered, Firebase will generate a GoogleService-Info.plist file, which you need to download and add to your project in Xcode.

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/step3.png" alt="Kitten"
	title="A cute kitten" width="420" />

That’s it – you now have a Firebase iOS project that can be used from within the Swift code. Let’s see how.

<a name="fstep2"/>

#### Adding Firebase Pods Dependencies to Your App

1. In order to query the Firebase project from within your iOS app, we need to use the Firebase iOS SDKs, which are a set of libraries provided by Google, to make it easy for iOS developer to use Firebase in their app. These Swift SDKs are basically bridging the communication of your iOS app with the Firebase backend.
To add the Firebase SDKs to your app, just add cocoapods dependencies to the Podfile. Getting started with Cocoapods is out of scope for this tutorial, so if you’re not familiar with it, check out http://cocoapods.org.
Open the Podfile file, and add the following lines:

```pod

  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Database'
  pod 'Firebase/Storage'
  pod 'GeoFire'

```

2. Once you do this, you need to run “pod install” in your terminal which will download the SDKs for you. A successful result will look like this in the terminal:

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/podinstall.png" alt="Kitten"
	title="A cute kitten" width="420" />

3. 'Now close your xcode project and got the project file and the file extention call .xcworkspace (white project file) Then open it.'
 
4. Firebase Inizilation:

To check whether this was successful, let’s see if we can use Firebase dependencies in the code now. Open up AppDelegate.swift and add this import:

```swift
import Firebase
...
```

Then, add this line as the first line of the application:didFinishLaunchingWithOptions: method:
```swift
...
FirebaseApp.configure()

...
```
This builds and runs successfully in Xcode. We’re done here and ready to jump into action.


<a name="createusers"/>

### Lets work with firebase

##### Create users and Login

1. For this we are going to use Firebase Realtime database, Lets create realtime database in test mode

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/firebasedatabase.png" alt="Kitten"
	title="A cute kitten" width="720" />

2. Lets add action for our sign up button

`button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)`

3. Then lets create user
```swift
// MARK: - Selectors
    
    @objc func handleSignUp() {
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            //
        }
    }

...
```
if you got any errors emailTextFiled has no memebr of text, convert emailTextFiled UIView to UITextfiled 

4. lets update that created user with database
```swift
    @objc func handleSignUp() {
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        guard let fullName = fullNameTextFiled.text else { return }
        let accountType = accountTypeSegmentedControl.selectedSegmentIndex
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Faild to register user with error \(error)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = [
                "email": email,
                "fullName": fullName,
                "accountType": accountType
                ] as [String : Any]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values) { (error, ref) in
                print("Successfuly Registerd and save data..")
            }
        }
    }
```
5. Lets work with login
```swift
...
import Firebase
...
    private let loginButton: AuthButtonUIButton = {
        let button = AuthButtonUIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
...
    @objc func handleSignIn() {
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Faild to log user with error \(error.localizedDescription)")
                return
            }
            
            //  guard let uid = result?.user.uid else { return }
            
            print("Login Successful..")
        }
    }
...
```

<a name="apphome"/>

### Home Controller and Stay Login

1. Lets create our app home view controller, this will be always root controller of the app, if user logged in we do nothing, but if your not looged in we will navigate to login view controller
2. Lets check user sign in and sign out methods
```swift
import UIKit
import Firebase

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycale

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIsUserLoggedIn()
        view.backgroundColor = .white
    }
    
    //MARK: API
    
    func checkIsUserLoggedIn() {
        if(Auth.auth().currentUser?.uid == nil) {
            print("DEBUG: User not logged in..")
        } else {
            print("DEBUG: User is logged in..")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: sign out error")
        }
    }
}
```
3. lets navigate users to login screen if user not log in
```swift
        if(Auth.auth().currentUser?.uid == nil) {
            let nav = UINavigationController(rootViewController: LoginViewController())
            present(nav, animated: true, completion: nil)
            
        } else {
            print("DEBUG: User is logged in..")
        }
```
4. After you run this this will probably not going to work, that because you have to wait until view load task get finish. to overcome this we can use DispatchQueue.main.async
```swift
    DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginViewController())
                self.present(nav, animated: true, completion: nil)
            }
```

5. For xocde 11 users you have to change navigation modal present style to full screen if you want that view in full screen
```swift
nav.modalPresentationStyle = .fullScreen
```

6. After user log in from our login controller we have to navigate home controller. Our login controller is now on top of the home view controller. We can navigate back to home controller by dissmiss form our login controller after we log in. so replace this
```swift
    self.dismiss(animated: true, completion: nil)
```
with success login print and success registation print of your code

<a name="mapkit"/>

### Work with map

#### configure

 MapKit is a powerful API available on iOS devices that makes it easy to display maps, mark locations, enhance with custom data and even draw routes or other shapes on top.

 1. lets add Map to your app. Before everything import MapKit to your code
 ```swift

import UIKit
import Firebase
import MapKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    private let mapView = MKMapView()
...
 
 // MARK: - Helper Function
    
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }

 ```
 2. If user login call `configureUI()` method inside the `checkIsUserLoggedIn`

 3. But now you will face problem again. What if you logout and log in again. You will see home screen without map view. that because `checkIsUserLoggedIn` is already created inside of the lifecycal method and its not calling again. because viewdidload already fired. for that we have to call `checkIsUserLoggedIn` before dissmiss the login view controller. Do the samething for signup controller

FOR IOS 13
 ```swift
 ...
let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
            
            guard let controller = keyWindow?.rootViewController as? HomeViewController else { return }
            controller.configureUI()
            
            self.dismiss(animated: true, completion: nil)
 ```

 Before IOS 13
 ```swift
...
guard let controller = UIApplication.shared.keyWindow?.rootViewController as? HomeViewController else { return }
            controller.configureUI()
            
            self.dismiss(animated: true, completion: nil)
```

<a name="userlocationservices"/>

#### Setup User Location Services

1. First of all we have to work with location manager to auth with location data,  then share location and update the user location. before that when we requesting sensitive data from user we have get permission from users. There is 2, 3 type of ways we can ask permission from the user

2. Open user plist file and add Privecy settings description. add new row and find "Privacy - Location When In Use Usage Description" and add the discription to it

3. add new row and add "Privacy - Location Always and When In Use Usage Description" also you have to add "Privacy - Location Always Usage Description"

4. When you do that user will get more options to give permission to his location

5. And then lets add the location manager to your home page `private let locationManager = CLLocationManager()` This will promt our users to allow us to access their location

6. check permission
```swift

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIsUserLoggedIn()
        enableLocationServices()

....
....
// MARK: - LocationServices

extension HomeViewController {
    func enableLocationServices() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("DEBUG: not Determined")
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            print("DEBUG: authorized When In Use")
        case .authorizedAlways:
            print("DEBUG: authorized Always")
        default:
            break
        }
    }
}

```

7. request permission and update location
```swift
switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
```

8. Now we have to check is this Authorization Status changers or not for that we have to work with location manager delegate

```swift
extension HomeViewController: CLLocationManagerDelegate {
    
    func enableLocationServices() {
        
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
```

9. We do this because if user accedently did not allowed it but user want to access map features again. so user has to chnage it via settings. basicaly it will be confusing

```swift
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }

```
10. Lets pin user location.

```swift
    // MARK: - Helper Function
    
    func configureUI() {
        confugireMapView()
    }
    
    func confugireMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }

```

11. Add user location in to simulator click on it go to features -> Location -> CustomLocation then add your coords

<a name="locationinputuserinterface"/>

#### Location input user interface

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/locationinputbutton.png" alt="Kitten"
	title="A cute kitten" width="240" />

1. Lets Create 'Where to?' button on top of mapview. Lets create Location Input Activation View class in view folder
```swift
class LocationInputActivationUIView: UIView {

   // MARK: - Properties
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    private let placeholderLable: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        
        return label
    }()
    
   // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.45
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
        
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(height: 6, width: 6)
        
        addSubview(placeholderLable)
        placeholderLable.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
```

2. to setup dimentions of the views lets create set dimention func in extentions
```swift
func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
```

3. and also lets make our centerY function to left padding
```swift
func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
```

4. Now you can add them to home view controller
```swift
private let inputActivationUIView = LocationInputActivationUIView ()
...
func configureUI() {
        confugireMapView()
        
        view.addSubview(inputActivationUIView)
        inputActivationUIView.centerX(inView: view)
        inputActivationUIView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationUIView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    }

```

5. You can also add nice ui aprear animation to this view when map load. add that to `configureUI()`
```swift
inputActivationUIView.alpha = 0
        
        UIView.animate(withDuration: 2) {
            self.inputActivationUIView.alpha = 1
        }
```
6. lets add `UITapGestureRecognizer` to give acction to this view when user tap on it
```swift
let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowLocationInputView))
        addGestureRecognizer(tap)

...

// MARK: - Selectors
    
    @objc func handleShowLocationInputView() {
        
    }
```

7. But this method we have to access form home view controller, so lets create delegete method to access that
```swift
import UIKit

protocol LocationInputActivationUIViewDelegate: class {
    func presentLocationInputView()
}

class LocationInputActivationUIView: UIView {

   // MARK: - Properties
    
    weak var delegate: LocationInputActivationUIViewDelegate?

...


        let tap = UITapGestureRecognizer(target: self, action: #selector(presentLocationInputView))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func presentLocationInputView() {
        delegate?.presentLocationInputView()
    }
    

```

8. lets callback that function to home view controller
```swift
...
inputActivationUIView.delegate = self
...
extension HomeViewController: LocationInputActivationUIViewDelegate {
    func presentLocationInputView() {
        print("DEBUG: LocationInputActivationUIViewDelegate called")
    }
}
```

<a name="locationinputview"/>

#### Location Input View

<img src="https://raw.githubusercontent.com/thuyiya/advanced_iOS_development/master/07_Proj_WorkWithFirebase/Docs/locationinput.png" alt="Kitten"
	title="A cute kitten" width="240" />

1. create view
```swift

class LocationInputView: UIView {

    // MARK: - Properties
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors
    
    
    // MARK: - Helper Functions
    
}

```
2. lets create back button
```swift
private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
        return button
    }()

    ...
    override init(frame: CGRect) {
            backgroundColor = .white
            
            addSubview(backButton)
            backButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44,
                            paddingLeft: 12, width: 24, height: 24)
    }

    ...

    // MARK: - Selectors
    
    @objc func handleBackTapped() {
        
    }

```

3. create common function for add shadow, go to extentions create func in uiview, then call `addShadow` inside LocationInputView init 
```swift
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.55
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
```
4. now lets configure location input view in `HomeController`
```swift
private let locationInputView = LocationInputView()
```
5. create configureLocationInputView function below `confugireMapView` func
```swift
func configureLocationInputView () {
        
    }
```
6. lets create animation get aprea the input view, this time lets get the animation complition callback to render the table view of place data
```swift
func configureLocationInputView () {
        view.addSubview(locationInputView)
        locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 200)
        locationInputView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.locationInputView.alpha = 1
        }) { _ in
            print("DEBUG: Present table view")
        }
    }
```
7. then lets configure location view inside `presentLocationInputView`
```swift
// MARK: - LocationInputActivationUIViewDelegate

extension HomeViewController: LocationInputActivationUIViewDelegate {
    func presentLocationInputView() {
        inputActivationUIView.alpha = 0
        configureLocationInputView()
    }
}
```
8. Lets add delegate for dissmiss this location input field. go to the `LocationInputView`. then call it when click back button
```swift
protocol LocationInputViewDelegate {
    func dismissLocationInputView()
}

class LocationInputView: UIView {

    // MARK: - Properties
    
    var delegate: LocationInputViewDelegate?
    
...

// MARK: - Selectors
    
    @objc func handleBackTapped() {
        delegate?.dismissLocationInputView()
    }

....
```
9. then lets create the LocationInputViewDelegate inside of the `HomeViewController` extentions. and alos remember to make the `locationInputView` deligation inside of the `configureLocationInputView`
```swift
...
func configureLocationInputView () {
        locationInputView.delegate = self
        
        view.addSubview(locationInputView)
        locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 200)
        locationInputView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.locationInputView.alpha = 1
        }) { _ in
            print("DEBUG: Present table view")
        }
    }
...
extension HomeViewController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.locationInputView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.inputActivationUIView.alpha = 1
            }
        }
    }
}
```
10. lets dissmiss our view in `dismissLocationInputView`
```swift
extension HomeViewController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.locationInputView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.inputActivationUIView.alpha = 1
            }
        }
    }
}

```
11. Lets add title and text field to our location input field. lets start with title
```swift

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "NIBM"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

```
12. then lets add it to subview and run it, before that update your extention centerX and centerY with `translatesAutoresizingMaskIntoConstraints = false`. otherwise you will see nothing
```swift
 // MARK: - Helper Functions
    
    func configureViewComponents() {
        backgroundColor = .white
        addShadow()
        
        addSubview(backButton)
        backButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44,
                          paddingLeft: 12, width: 24, height: 24)
        
        addSubview(titleLabel)
        titleLabel.centerY(inView: backButton)
        titleLabel.centerX(inView: self)
    }
```
13. then lets create the connecting dot of the two location input field
```swift
 private let startLocationIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let linkingView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let destinationIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
```
14. and then lets create text fields
```swift
lazy var startingLocationTextField: UITextField = {
        let tf = UITextField()
        
        return tf
    }()
    
    lazy var destinationTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
```
15. lets make it look like the ui
```swift
lazy var startingLocationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Current Location"
        tf.backgroundColor = .groupTableViewBackground
        tf.isEnabled = false
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.leftViewMode = .always
        
        return tf
    }()
    
    lazy var destinationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a destination.."
        tf.backgroundColor = UIColor.rgb(red: 215, green: 215, blue: 215)
        tf.returnKeyType = .search
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.clearButtonMode = .whileEditing
        return tf
    }()
```
16. lets add that to view
```swift
addSubview(startingLocationTextField)
        startingLocationTextField.anchor(top: backButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 40, paddingRight: 40, height: 30)

addSubview(destinationTextField)
        destinationTextField.anchor(top: startingLocationTextField.bottomAnchor, left: leftAnchor,
                                    right: rightAnchor, paddingTop: 12, paddingLeft: 40,
                                    paddingRight: 40,height: 30)
```

17. Then run it, if all gose well you will see we need to add small padding before text type start in inputfield to look better. so lets update our ui inout fields

```swift
lazy var startingLocationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Current Location"
        tf.backgroundColor = .groupTableViewBackground
        tf.isEnabled = false
        tf.font = UIFont.systemFont(ofSize: 14)
        
        let paddingView = UIView()
        paddingView.setDimensions(height: 30, width: 8)
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        return tf
    }()
    
    lazy var destinationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a destination.."
        tf.backgroundColor = UIColor.rgb(red: 215, green: 215, blue: 215)
        tf.returnKeyType = .search
        tf.font = UIFont.systemFont(ofSize: 14)
        let paddingView = UIView()
        paddingView.setDimensions(height: 30, width: 8)
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.clearButtonMode = .whileEditing
        return tf
    }()
```

18. lets add `startLocationIndicatorView` and `destinationIndicatorView`
```swift
addSubview(startLocationIndicatorView)
        startLocationIndicatorView.centerY(inView: startingLocationTextField, leftAnchor: leftAnchor, paddingLeft: 20)
        startLocationIndicatorView.setDimensions(height: 6, width: 6)
        startLocationIndicatorView.layer.cornerRadius = 6 / 2
        
        addSubview(destinationIndicatorView)
        destinationIndicatorView.centerY(inView: destinationTextField, leftAnchor: leftAnchor, paddingLeft: 20)
        destinationIndicatorView.setDimensions(height: 6, width: 6)
```
19. lets link these indicators
```swift
addSubview(linkingView)
        linkingView.anchor(top: startLocationIndicatorView.bottomAnchor,
                           bottom: destinationIndicatorView.topAnchor, paddingTop: 4,
                           paddingLeft: 0, paddingBottom: 4, width: 0.5)
        linkingView.centerX(inView: startLocationIndicatorView)
```
20. lets see what we got, run the project
21. Now lets create the table view bellow our `LocationInputView` insde of `HomeViewController`. lets create ref and function for confugire table view
```swift
// MARK: - Properties
...
    private let tableView = UITableView()
...

    func configureTableView() {
        
    }
```
22. lets set the datasoure and delegate, inside `configureTableView`
```swift
    tableView.delegate = self
    tableView.dataSource = self
```
23. for that we have to inherite the delegate
```swift
// MARK: - UITableViewDelegate/DataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
}
```
24. now we have to create `LocationTableViewCell` lets create new file in view
```swift
class LocationTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

```
25. lets register the table view cell to tableview. 
```swift
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
```
26. then lets define this `reuseIdentifier` top of the class
```swift
private let reuseIdentifier = "LocationCell"
```
27. lets add the table view cell to `cellForRowAt`
```swift
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationTableViewCell
        
        return cell
    }
    
    
}

```
28. then now we have to give table view hight. but we have to remove `locationInputView` Height from the table view first we set it as 200 before, so lets make a variable to keep that value as const `private final let locationInputViewHeight: CGFloat = 200`
then lets update the height inside `configureLocationInputView` and remove  locationInputViewHeight from table view
```swift
func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView()
        
        let height = view.frame.height - locationInputViewHeight
        tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)
        
        view.addSubview(tableView)
    }
```
29. Now lets call the `configureTableView` end of the `configureUI` method
30. Now if you run this this will not show the table view that because its in all the way down, you can see that by changing `tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)` y axis value
31. lets animate the table view once you click the input button, so we can present our table view inside of the completion of animation in `configureLocationInputView` function. lets replace `print("DEBUG: Present table view")`
```swift
    self.tableView.frame.origin.y = self.locationInputViewHeight
```
32. so lets add animation to it
```swift
    self.tableView.frame.origin.y = self.locationInputViewHeight
```
33. there is small problem when we configure the configureLocationInputView, becuase everytime when we call it. its adding the `locationInputView` to the view. so we can fixed it by remove it from super view
```swift
extension HomeViewController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.locationInputView.alpha = 0
        }) { _ in
            self.locationInputView.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {
                self.inputActivationUIView.alpha = 1
            }
        }
    }
}

```
34. now we have to remove out table view when we come back from input location view.
```swift
    extension HomeViewController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.locationInputView.alpha = 0
            self.tableView.frame.origin.y = self.view.frame.height
        }) { _ in
            self.locationInputView.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {
                self.inputActivationUIView.alpha = 1
            }
        }
    }
}
```
35. lets setup the cell of the table view
```swift
 class LocationTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Dr samarapala perera road"
        return label
    }()
    
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Dr samarapala perera road, Boralasgamuwa"
        return label
    }()

```
36. then lets add them to the cell inside of the init
```swift
let stack = UIStackView(arrangedSubviews: [titleLabel, addressLabel])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 8)    }
```
37. then lets make the section for each by two and results
```swift
// MARK: - UITableViewDelegate/DataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "hello"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationTableViewCell
        
        return cell
    }
}

```


<a name="fetchuserdatawithfirebase"/>

#### Fetch user data with firebase

1. Lets create our `Service.swift` class and work with api to get user related data
```swift
import Firebase

struct Service {
    func fetchUserData() {
        print("DEBUG: fetch User Data")
    }
}

```
2. lets call that function insde home controller
```swift
//MARK: API
    
    func fetchUserData() {
        Service().fetchUserData()
    }
    
```
3. everytime When we call service, it will call new ref everytime. but we can create one instance of it and call it everytime. we can do it by creating ref as instance variable. but its not the best way. if we do that we have to do it evey file. when we try to call it. Best way is lets make it as sigalton

```swift
import Firebase

struct Service {
    
    static let shared = Service()
    
    func fetchUserData() {
        print("DEBUG: fetch User Data")
    }
}

```
4. then you can call it inside home controller
```swift
//MARK: API
    
    func fetchUserData() {
        Service.shared.fetchUserData()
    }
    
```
5. now lets user data
```swift
import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

// MARK: - SharedService

struct Service {
    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    
    func fetchUserData() {
        REF_USERS.child(currentUid!).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
        }
    }
}

```
6. lets get the full name of user and set inputlocation view title as it is
```swift
func fetchUserData(completion: @escaping(String) -> Void) {
        REF_USERS.child(currentUid!).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let fullname = dictionary["fullName"] as? String else { return }
            completion(fullname)
        }
    }

```
```swift
...
 private var fullName: String? {
        didSet {
            locationInputView.titleLabel.text = fullName
        }
    }
    ...
//MARK: API
    
    func fetchUserData() {
        Service.shared.fetchUserData { (fullName) in
            self.fullName = fullName
        }
    }


```
7. Lets create model for user. it will be easy for construct the details
```swift
struct User {
    let fullName: String
    let email: String
    let accountType: Int
    
    init(dictionary: [String: Any]) {
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}

```
8. now lets return user unless firstname
```swift
struct Service {
    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    
    func fetchUserData(completion: @escaping(User) -> Void) {
        REF_USERS.child(currentUid!).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
}

```

in our home controller lets get full name from model

```swift
...
    private var user: User? {
        didSet {
            locationInputView.user = user
        }
    }
...

    func fetchUserData() {
        Service.shared.fetchUserData { (user) in
            self.user = user
        }
    }
```

in locationInputView
```swift 
// MARK: - Properties
    
    var user: User? {
        didSet { titleLabel.text = user?.fullName }
    }
```

<a name="nearbydrivers"/>

#### Display Nearby Drivers on map

lets add driver locations to the database, for that we have to get location when user start to register to the application. then we have to make our location manager accesible from anyware

1. so lets work with firebase Geofire

SignUpViewController
```swift
import GeoFire
...
@objc func handleSignUp() {
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        guard let fullName = fullNameTextFiled.text else { return }
        let accountType = accountTypeSegmentedControl.selectedSegmentIndex
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Faild to register user with error \(error)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = [
            "email": email,
            "fullName": fullName,
            "accountType": accountType
            ] as [String : Any]
            
            if accountType == 1 {
                var geoFire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
                <!-- geoFire.setLocation(<#T##location: CLLocation##CLLocation#>, forKey: uid, withCompletionBlock: { (error) in
                    //do stuff in here
                }) -->
            }
        ...
```

and create location ref in service `let REF_DRIVER_LOCATIONS = DB_REF.child("driver-locations")`

2. then lets create `LocationHandler` file inside of the utils
```swift
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    static let shared = LocationHandler()
    var locationManager: CLLocationManager!
    var location: CLLocation?
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
}
```
3. lets remove location stuff from home controller and add them to location handler

LocationHandler

```swift
func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
```

HomeViewController

```swift
...
private let locationManager = LocationHandler.shared.locationManager
...
// MARK: - LocationServices

// MARK: - LocationServices

extension HomeViewController {
    
    func enableLocationServices() {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager?.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager?.startUpdatingLocation()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
    
    
}

```

4. lets print the user locartion in signup page
```swift
 let sharedLocationanager = LocationHandler.shared.locationManager
        print("DEBUG: Locaion is \(sharedLocationanager?.location
```
5. if you got crash when you try to logout, lets remove the current uid
```swift

struct Service {
    static let shared = Service()
    
    func fetchUserData(completion: @escaping(User) -> Void) {
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(currentUid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
}

```
6. lets set the loication in sigup controller
```swift
class SignUpViewController: UIViewController {
    // MARK: - Properties
    
    private var location = LocationHandler.shared.locationManager.location

    ...

    // MARK: - Helper Function
    
    func uploadUserDataAndShowHomeController(uid: String, values: [String: Any]) {
        REF_USERS.child(uid).updateChildValues(values) { (error, ref) in
            
            //handle error
            
            let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
            
            guard let controller = keyWindow?.rootViewController as? HomeViewController else { return }
            controller.configureUI()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    ...

    @objc func handleSignUp() {
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        guard let fullName = fullNameTextFiled.text else { return }
        let accountType = accountTypeSegmentedControl.selectedSegmentIndex
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Faild to register user with error \(error)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = [
            "email": email,
            "fullName": fullName,
            "accountType": accountType
            ] as [String : Any]
            
            if accountType == 1 {
                var geoFire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
                
                guard let location = self.location else { return }
                
                geoFire.setLocation(location, forKey: uid, withCompletionBlock: { (error) in
                   self.uploadUserDataAndShowHomeController(uid: uid, values: values)
                })
            }
            
            self.uploadUserDataAndShowHomeController(uid: uid, values: values)
...
```

7. then lets run and create a driver
8. Lets get nearest drivers in service
```swift
func fetchDriversLocation(location: CLLocation) {
        let geoFire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
        
        REF_DRIVER_LOCATIONS.observe(.value) { (snapshot) in
            geoFire.query(at: location, withRadius: 50).observe(.keyEntered, with: { (uid, location) in
                print("DEBUG: Uid is \(uid)")
                print("DEBUG: location coordinate is \(location.coordinate)")
            })
        }
    }
```
9. lets call it in home controller
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        checkIsUserLoggedIn()
        enableLocationServices()
        fetchUserData()
        fetchDrivers()
        
        //        signOut()
        view.backgroundColor = .white
    }
    
    //MARK: API
    
    func fetchUserData() {
        Service.shared.fetchUserData { (user) in
            self.user = user
        }
    }
    
    func fetchDrivers() {
        guard let location = locationManager?.location else { return }
        
        Service.shared.fetchDriversLocation(location: location)
    }
```
10. lets fetch any user data

Service
```swift
func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
```

HomeController
```swift
//MARK: API
    
    func fetchUserData() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        Service.shared.fetchUserData(uid: currentUid) { (user) in
            self.user = user
        }
    }
```

11. lets set the driver location

model
```swift
import CoreLocation

struct User {
    let fullName: String
    let email: String
    let accountType: Int
    var location: CLLocation?
    
    init(dictionary: [String: Any]) {
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}

```

homecontroller
```swift
    func fetchDrivers() {
        guard let location = locationManager?.location else { return }
        
        Service.shared.fetchDriversLocation(location: location) { (user) in
            print("DEBUG: drive \(user.location)")
        }
    }


```
service/ get drivers frim 50 radius 

```swift
func fetchDriversLocation(location: CLLocation, completion: @escaping(User) -> Void) {
        let geoFire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
        
        REF_DRIVER_LOCATIONS.observe(.value) { (snapshot) in
            geoFire.query(at: location, withRadius: 50).observe(.keyEntered, with: { (uid, location) in
                self.fetchUserData(uid: uid) { (user) in
                    var driver = user
                    driver.location = location
                    completion(driver)
                }
            })
        }
    }
```

<a name="diplaydriversonmap"/>

#### Display the drivers on map

1. lets create a file for  `DriverAnnotation` in model class
```swift
import MapKit

class DriverAnnotation: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var uid: String
    
    init(uid: String, coordinate: CLLocationCoordinate2D) {
        self.uid = uid
        self.coordinate = coordinate
    }
    
}
```
2. And the setup the annotation for dirvers
```swift
func fetchDrivers() {
        guard let location = locationManager?.location else { return }
        
        Service.shared.fetchDriversLocation(location: location) { (driver) in
            guard let coordinate = driver.location?.coordinate else { return }
            let annotation = DriverAnnotation(uid: driver.uid, coordinate: coordinate)
        }
    }
```
3. get driver uid from ussr model we have update the model
```swift
struct User {
    let fullName: String
    let email: String
    let accountType: Int
    var location: CLLocation?
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}

```
4. lets update the uid when set users in Service
```swift
func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }

```
5. but there is small problem. this will add same user twice. this happen when we use observe method in firebase, everytime when change the database this will call the add anotation with new coords. lets fix that

lets create custom anotation, lets make the delagation inside `confugireMapView`

```swift
mapView.delegate = self
```
6. 
then create the `// MARK: - LocationServices` the delegation

```swift
// MARK: - MKMapViewDelegate

extension HomeViewController: MKMapViewDelegate {
    
}

```
7. lets replace the driver pin

```swift
private let annotationIdentifier = "DriverAnnotation"
...
// MARK: - MKMapViewDelegate

extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? DriverAnnotation {
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            view.image = #imageLiteral(resourceName: "chevron-sign-to-right")
            return view

        }
        
        return nil
    }
}
```

<a name="updaetdriverpositionrealtime"/>

#### Updaet driver position real time

1. Haddle update driver position without create new pin (annotation)
```swift
func fetchDrivers() {
        guard let location = locationManager?.location else { return }
        
        Service.shared.fetchDriversLocation(location: location) { (driver) in
            guard let coordinate = driver.location?.coordinate else { return }
            let annotation = DriverAnnotation(uid: driver.uid, coordinate: coordinate)
            
            var driverIsVisible: Bool {
                
                return self.mapView.annotations.contains { (annotation) -> Bool in
                    guard let driverAnno = annotation as? DriverAnnotation else { return false }
                    
                    if driverAnno.uid == driver.uid {
                        print("DEBUG: Haddle update driver position")
                        return true
                    }
                    
                    return false
                }
            }
            
            if !driverIsVisible {
                self.mapView.addAnnotation(annotation)
            }
        }
    }
```
2. lets update it realtime, for that lets create function inside the driverlocation model
```swift
func updateAnnotationPosition(withCoordinate coordinate: CLLocationCoordinate2D) {
        UIView.animate(withDuration: 0.2) {
            self.coordinate = coordinate
        }
    }
```
inside fetchDrivers lets update it. when you update the modal value from outside. that varibale shoud be dynamic, otherwise you will not get the change

```swift
return self.mapView.annotations.contains { (annotation) -> Bool in
                    guard let driverAnno = annotation as? DriverAnnotation else { return false }
                    
                    if driverAnno.uid == driver.uid {
                        driverAnno.updateAnnotationPosition(withCoordinate: coordinate)
                        return true
                    }
                    
                    return false

```

you can test this by changin location numbers from realtimedatabase

<a name="searchanddisplay"/>

#### Search and Display Locations

1. now when we login 
```swift
checkIsUserLoggedIn()
        enableLocationServices()
        fetchUserData()
        fetchDrivers()
```
these function are not going to call, so lets meke it happen

lets remove `fetchUserData()` and `fetchDrivers()` from viewdid load, then creaet new function to run

```swift
// MARK: - Helper Function
    
    func configure() {
        configureUI()
        fetchUserData()
        fetchDrivers()
    }
```

then call it inisde of the check user
```swift
func checkIsUserLoggedIn() {
        if(Auth.auth().currentUser?.uid == nil) {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configure()
        }
    }
```
remeber to update login and signup controller `configureUI` to `configure`

2. Lets search location. for that we need to on change event of the ui text field. 
```swift
protocol LocationInputViewDelegate {
    func dismissLocationInputView()
    func executeSearch(query: String)
}


...

extension LocationInputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let query = textField.text else { return false }
        delegate?.executeSearch(query: query)
        return true
    }
}
```

```swift
// MARK: - LocationInputViewDelegate

extension HomeViewController: LocationInputViewDelegate {
    func executeSearch(query: String) {
        print("DEBUG: query is \(query)")
    }

```
3. 