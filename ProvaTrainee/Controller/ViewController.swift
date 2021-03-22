import UIKit

class ViewController: UIViewController {
    
    var loadData = Service()
    var numbers: [Numbers] = []
    
    @IBOutlet weak var tfFirstValue: UITextField!
    @IBOutlet weak var tfSecondValue: UITextField!
    
    @IBAction func btResult(_ sender: Any) {
        
        getResult()
    }
    
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(numbers)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDatas()
        lbResult.isHidden = true
    }
    
    func getResult(){
        if let one = self.numbers.first?.myArray.first,
           let two = self.numbers.last?.myArray.last{
            let result = one * two
            
            lbResult.text = "\(result)"
            lbResult.isHidden = false
        }
    }
    
    func loadDatas(){
        
        loadData.loadData { (model) in
            
            if let model = model{
                self.numbers = model
                
                if let one = self.numbers.first?.myArray.first,
                   let two = self.numbers.last?.myArray.last{
                    
                    DispatchQueue.main.async {
                        self.tfFirstValue.text = "\(one)"
                        self.tfSecondValue.text = "\(two)"
                    }
                }
            }
        }
        
    }
}


