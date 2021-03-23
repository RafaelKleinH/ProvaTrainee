import UIKit

class ViewController: UIViewController {
    
    var loadData = Service()
    var numbers: [Numbers] = []
    
    @IBOutlet weak var tfFirstValue: UITextField!
    @IBOutlet weak var tfSecondValue: UITextField!

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    @IBAction func btResult(_ sender: Any) {
        
        getResult()
    }
    
    
    @IBOutlet weak var lbResult: UILabel!
    
    func loadDisappear(){
        loadingView.isHidden = true
        loading.stopAnimating()
    }
    
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
                        self.loadDisappear()
                        self.tfFirstValue.text = "\(one)"
                        self.tfSecondValue.text = "\(two)"
                    }
                }
            }
        }
        
    }
}


