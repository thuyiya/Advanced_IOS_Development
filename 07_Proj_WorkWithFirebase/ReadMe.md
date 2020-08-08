##Taxi App
####Taxi app using firebase without storyboard

1. create sigle view application
2. Create 5 group folders in project root clicking on project root foler 'New Group'
3. Name them as Model, View, Controller, Service and Utils
4. Remove the ViewControler file and lets create our login and signup view controller files
5. Remove the SenceDelegate file and Main storyboard and remove main storyboard referance from Project genaral settings
6. Navigate back to pList and remove any key related Main storyboard and remove "Application Scene Manifest" also 
7. Now create your LoginViewController class. Right click on Controller folder create new swift file
```import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
```
8. Go to loginviewcontroller and set the background color red and check its working or not
```
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }

}
```
9. Lets setup our login screen
10. For esay navigation you can create MARK comment on top of every section in your code
```
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
```
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
```
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