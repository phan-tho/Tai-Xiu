import UIKit

class AllInOne: UIViewController {
    var balance = 100000000
    var moneyCuoc: Int!
    var yourChoose: Int!                        // 1 is tai; 2 is xiu
    var arr = [0, 0, 0]
    var sum = 0
    var NumToMode = 21                          // 21%2 /= 2 ==> 101010
    
    
    @IBOutlet var Plate: UIImageView!               // dia
    
    
    @IBOutlet var BetTai: UILabel!
    @IBOutlet var BetXiu: UILabel!
   
    @IBOutlet var PlusMoney: [UIButton]!            // +1 +50M
    
    @IBOutlet var ShowBalance: UILabel!             // show balance
    
    @IBOutlet var XXs: [UIImageView]!
    
    @IBOutlet var HideCuocTaiWhenTap: UIImageView!
    @IBOutlet var HideCuocXiuWhenTap: UIImageView!
    
    @IBOutlet var ButtonXIu: UIButton!                  // button cuoc xiu and tai
    @IBOutlet var ButtonTai: UIButton!
    
    @IBOutlet var ButtonOpenPlate: UIButton!            // PLATE
    
    @IBOutlet var ShowCredit: UILabel!                  // Show Credit 
    
    @IBOutlet var ResultIsTai: UIImageView!
    @IBOutlet var ResultIsXiu: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BetTai.textColor = .yellow
        BetXiu.textColor = .yellow
        ShowBalance.textColor = .yellow
        ShowBalance.text = AmountToString(num: balance)
        
        Plate.layer.cornerRadius = 69
        
        for xx in XXs {
            xx.layer.cornerRadius = 30
            xx.layer.masksToBounds = true
        }
        
        OffExtraMoney()
        ButtonOpenPlate.isEnabled = false
        
        ShowCredit.alpha = 0
        ShowCredit.textColor = .yellow
        
        ResultIsTai.alpha = 0
        ResultIsXiu.alpha = 0
    }

    @objc func UpDia() {
        Plate.isHidden = false
    }
    
    func ContinuePlay() {
        OffExtraMoney()
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpDia), userInfo: nil, repeats: false)
        ButtonTai.isEnabled = true
        ButtonXIu.isEnabled = true
        ButtonOpenPlate.isEnabled = false
    }
    
    @IBAction func ChooseTai(_ sender: UIButton) {                      // tap cuoc tai
        OnExtraMoney()
        yourChoose = 1                                          // asset result to Int
        HideCuocTaiWhenTap.isHidden = true                      // Hide button "Cuoc"
        ButtonTai.isEnabled = false                             // Turn off button Cuoc
        ButtonXIu.isEnabled = false
        moneyCuoc = 0
        ShowAmountBet()
    }
    
    @IBAction func ChooseXiu(_ sender: UIButton) {                          // tap cuoc xiu
        OnExtraMoney()
        yourChoose = 2
        HideCuocXiuWhenTap.isHidden = true
        ButtonTai.isEnabled = false
        ButtonXIu.isEnabled = false
        moneyCuoc = 0
        ShowAmountBet()
    }
    
    @IBAction func TappedOK(_ sender: UIButton) {
        OffExtraMoney()
        HideCuocTaiWhenTap.isHidden = false
        HideCuocXiuWhenTap.isHidden = false
        ButtonOpenPlate.isEnabled = true
    }
    
    @IBAction func TappedOpen(_ sender: UIButton) {
        Ran3Num()
        displayXX()
        ShowResultAndUpdateBalance()
        ContinuePlay()
    }
    
    
    
                                                                    // Show Amount of money Bet And Balance Availabe
    @IBAction func Tapped1K(_ sender: UIButton) {
        moneyCuoc += 1000
        balance -= 1000
        ShowAmountBet()
    }
    @IBAction func Tapped10K(_ sender: UIButton) {
        moneyCuoc += 10000
        balance -= 10000
        ShowAmountBet()
    }
    @IBAction func Tapped50K(_ sender: UIButton) {
        moneyCuoc += 50000
        balance -= 50000
        ShowAmountBet()
    }
    @IBAction func Tapped100K(_ sender: UIButton) {
        moneyCuoc += 100000
        balance -= 100000
        ShowAmountBet()
    }
    @IBAction func Tapped500K(_ sender: UIButton) {
        moneyCuoc += 500000
        balance -= 500000
        ShowAmountBet()
    }
    @IBAction func Tapped1M(_ sender: UIButton) {
        moneyCuoc += 1000000
        balance -= 1000000
        ShowAmountBet()
    }
    @IBAction func Tapped10M(_ sender: UIButton) {
        moneyCuoc += 10000000
        balance -= 10000000
        ShowAmountBet()
    }
    @IBAction func Tapped50M(_ sender: UIButton) {
        moneyCuoc += 50000000
        balance -= 50000000
        ShowAmountBet()
    }    
    
}
