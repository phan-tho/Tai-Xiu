import UIKit

extension AllInOne {

    func AmountToString(num n: Int) -> String {                 // chuyen tu so sang kieu M B .000
        var num: Int = n
        var str: String = "  "
        while num >= 1000000000 {
            num /= 1000000000
            str.insert("B", at: str.startIndex)
        }
        while num >= 1000000 {
            num /= 1000000
            str.insert("M", at: str.startIndex)
        }
        
        if num >= 1000 {
            num /= 1000
            str.insert("0", at: str.startIndex)
            str.insert("0", at: str.startIndex)
            str.insert("0", at: str.startIndex)
            str.insert(".", at: str.startIndex)
        }
        return "\(num)" + str
    }
    
    func ShowAmountBet(){                                   // show balance and amount of money bet
        if balance < 0{
            moneyCuoc = moneyCuoc + balance
            balance = 0
            OffExtraMoney()
        }
        if yourChoose == 1 {
            BetTai.text = AmountToString(num: moneyCuoc)
        } else {
            BetXiu.text = AmountToString(num: moneyCuoc)
        }
        ShowBalance.text = AmountToString(num: balance)
    }
    
    
    
    func Ran3Num() {                                        // ram 3 xx
        for i in 0..<3 {
            let randomNum = Int.random(in: 1...6)
            arr[i] = randomNum
        }
    }
    
    
    
    func check() -> Int {                   // 1 is tai; 2 is xiu
        sum = 0
        for i in arr {
            sum += i
        }
        if sum > 10 {
            return 1
        } else {
            return 2
        }
    }
    
    
    
    @objc func HideCredit(){                                // animation show and hide
        ShowCredit.alpha = 0
    }
    
    @objc func HideXiu(timer: Timer){                           // Hide and show xiu
        if NumToMode == 0 {
            timer.invalidate()
        }
        ResultIsXiu.alpha = CGFloat(NumToMode%2)                    // numToMode = 21
        NumToMode /= 2
    }
    
    @objc func HideTai(timer: Timer){
        if NumToMode == 0 {
            timer.invalidate()
        }
        ResultIsTai.alpha = CGFloat(NumToMode%2)
        NumToMode /= 2
    }
    func StartProcessWithTai() {
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(HideTai), userInfo: nil, repeats: true)
    }
    func StartProcessWithXiu() {
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(HideXiu), userInfo: nil, repeats: true)
    }
    
    func ShowResultAndUpdateBalance() {                                              // Show result
        NumToMode = 85
        if check() == 1 {
            StartProcessWithTai()
        } else {
            StartProcessWithXiu()
        }
        
        
        if (yourChoose == check()) {
            ShowCredit.alpha = 0.9
            ShowCredit.text = "+" + AmountToString(num: moneyCuoc*2)
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(HideCredit), userInfo: nil, repeats: false)
            balance += moneyCuoc*2
            ShowAmountBet()
        }
    }
    
    func displayXX() {                                          // display xx
        Plate.isHidden = true
        XXs[0].image        = NumToImage(num: arr[0])
        XXs[1].image        = NumToImage(num: arr[1])
        XXs[2].image        = NumToImage(num: arr[2])
    }
    
    
    
    func NumToImage(num: Int) -> UIImage {
        switch num {
        case 1:
            return UIImage(named: "xx1")!
        case 2:
            return UIImage(named: "xx2")!
        case 3:
            return UIImage(named: "xx3")!
        case 4:
            return UIImage(named: "xx4")!
        case 5:
            return UIImage(named: "xx5")!
        default:
            return UIImage(named: "xx6")!
        }
    }
    
    func OnExtraMoney() {                                       // Enable button extra money
        for plus in PlusMoney {
            plus.isEnabled = true
        }
    }
    
    func OffExtraMoney() {
        for plus in PlusMoney {
            plus.isEnabled = false
        }
    }
    
    
}
