//
//  TwoSumViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/25.
//

import UIKit

class TwoSumViewController: UIViewController {
    var nums: [Int] = []
    var targetNum: Int? = nil

    @IBOutlet weak var numsLbl: UILabel!
    @IBOutlet weak var addNumbBtn: UIButton!
    @IBOutlet weak var removeNumBtn: UIButton!
    @IBOutlet weak var targetLbl: UILabel!
    @IBOutlet weak var targetBtn: UIButton!
    @IBOutlet weak var outputLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        initUI()
        bind()
    }

    func initUI(){

    }

    func bind(){
        addNumbBtn.addTarget(self, action: #selector(addNumBtnAction), for: .touchUpInside)
        removeNumBtn.addTarget(self, action: #selector(removeNumBtnAction), for: .touchUpInside)
    }

    @objc func addNumBtnAction(){
        let alert = UIAlertController(title: "Add Num", message: "Enter An Num", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter a new number into nums."
            textField.keyboardType = .numberPad
        }
        let addAction = UIAlertAction(title: "ADD", style: .default) { (_) in
            guard let newNumber = ((alert.textFields?.first)! as UITextField).text else {
                return
            }
            if newNumber != "" {
                self.nums.append(Int(newNumber)!)
                var numsString = ""
                for num in self.nums {
                    if numsString != "" {
                        numsString = "\(numsString), \(num)"
                    } else {
                        numsString = "\(num)"
                    }
                }
                self.numsLbl.text = "nums: [\(numsString)]"
            }

            //Check nums & target
            if self.nums.isEmpty {
                self.alertMessage(title: "Nums is empty", message: nil)
                return
            }
            guard let targetNum = self.targetNum else {
                self.alertMessage(title: "Target is nil", message: nil)
                return
            }

            //Deal nums & target
            print("nums: \(self.nums)")
            print("targetNum: \(targetNum)")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }

    @objc func removeNumBtnAction(){
        print("Remove")
    }

    func alertMessage(title:String,message:String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//if let page2VC = storyboard?.instantiateViewController(withIdentifier: "page2Identify") as? Page2ViewController {
//    navigationController?.pushViewController(page2VC, animated: true)
//    page2VC.page2ViewModel = Page2ViewModel(apiDatas: apiData)
//}
