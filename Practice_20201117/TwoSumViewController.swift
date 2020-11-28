//
//  TwoSumViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/25.
//

import UIKit

class TwoSumViewController: UIViewController {
    var twoSumViewModel = TwoSumViewModel()

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
        targetBtn.addTarget(self, action: #selector(targetAction), for: .touchUpInside)
    }

    @objc func targetAction(){
        let alert = UIAlertController(title: "Add Target", message: "Enter A Target", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter a new target."
            textField.keyboardType = .numberPad
        }
        let addAction = UIAlertAction(title: "ADD", style: .default) { (_) in
            guard let newNumber = ((alert.textFields?.first)! as UITextField).text else {
                return
            }
            if newNumber != "" {
                self.twoSumViewModel.setTarget(newTarget: Int(newNumber)!)
                self.setTarget()
            }

            //Check nums & target
            if self.checkOutput() == false {
                return
            }

            //Fixme
            //Deal nums & target
//            print("nums: \(self.nums)")
            //checkOutput check targetNum not nil
//            print("targetNum: \(self.targetNum!)")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
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
                self.twoSumViewModel.appendNums(num: Int(newNumber)!)
                self.setNumLbl()
            }

            //Check nums & target
            if self.checkOutput() == false {
                return
            }

            //FIXME
            //Deal nums & target
//            print("nums: \(self.nums)")
            //checkOutput check targetNum not nil
//            print("targetNum: \(self.targetNum!)")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }

    @objc func removeNumBtnAction(){
        if twoSumViewModel.checkNumsEmpty() {
            alertMessage(title: "nums is empty", message: nil)
        }
        let alertVC = AlertTableViewController()
        alertVC.tableViewArray = twoSumViewModel.getNums()
        alertVC.delegate = self

        let alert = UIAlertController(title: "Remove num", message: "Remove num from nums", preferredStyle: .alert)
        alert.setValue(alertVC, forKey: "contentViewController")
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }

    func setNumLbl(){
        let numsString = twoSumViewModel.getNumsLblString()
        self.numsLbl.text = "nums: [\(numsString)]"
    }

    func setTarget(){
        guard let targetNum = twoSumViewModel.getTarget() else {
            alertMessage(title: "target is nil!!", message: nil)
            return
        }
        targetLbl.text = "Target: \(targetNum)"
    }

    func alertMessage(title:String,message:String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    func checkOutput() -> Bool {
        if self.twoSumViewModel.checkNumsEmpty() {
            self.outputLbl.text = "Output: Nums is empty."
            return false
        }
        if self.twoSumViewModel.getTarget() == nil {
            self.outputLbl.text = "Output: Target is nil."
            return false
        }
        return true
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

extension TwoSumViewController: AlertTableViewControllerDelegate {
    func setSelected(sentData: String) {
        guard twoSumViewModel.removeValueFromNums(element: Int(sentData)!) else {
            alertMessage(title: "Target is nil!!!!", message: nil)
            return
        }
        setNumLbl()
        let _ = self.checkOutput()
    }
}
