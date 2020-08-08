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