```swift
import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people: [NSManagedObject] = []
    var names: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The List"
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      //1
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      
      //2
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
      
      //3
      do {
        people = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }
    
    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Name",
                                        message: "Add a new name",
                                        preferredStyle: .alert)
          
          let saveAction = UIAlertAction(title: "Save",
                                         style: .default) {
            [unowned self] action in
                                          
            guard let textField = alert.textFields?.first,
              let nameToSave = textField.text else {
                return
            }
            
            self.names.append(nameToSave)
            self.tableView.reloadData()
          }
          
          let cancelAction = UIAlertAction(title: "Cancel",
                                           style: .cancel)
          
          alert.addTextField()
          
          alert.addAction(saveAction)
          alert.addAction(cancelAction)
          
          present(alert, animated: true)
        }
    
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath)
                 -> UITableViewCell {

    let cell =
      tableView.dequeueReusableCell(withIdentifier: "Cell",
                                    for: indexPath)
    cell.textLabel?.text = names[indexPath.row]
    return cell
  }
}
```


(Follow) [https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial]