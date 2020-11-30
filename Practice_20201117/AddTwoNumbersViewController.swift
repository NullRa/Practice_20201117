//
//  AddTwoNumbersViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/30.
//

import UIKit

class AddTwoNumbersViewController: UIViewController {
    var listA:[Int] = []
    var listB:[Int] = []

    @IBOutlet weak var listALbl: UILabel!
    @IBOutlet weak var listABtn: UIButton!
    @IBOutlet weak var listBLbl: UILabel!
    @IBOutlet weak var listBBtn: UIButton!
    @IBOutlet weak var listSumLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        bind()
    }
    func initUI(){

    }
    func bind(){
        listABtn.tag = 1
        listABtn.addTarget(self, action: #selector(addList(sender:)), for: .touchUpInside)
        listBBtn.tag = 2
        listBBtn.addTarget(self, action: #selector(addList(sender:)), for: .touchUpInside)
    }
    @objc func addList(sender:UIButton){
        let title = sender.tag == 1 ? "Set ListA" : "Set ListB"
        let alert = UIAlertController(title: title, message: "Enter A New Number", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter A New Number."
            textField.keyboardType = .numberPad
        }
        let addAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            guard let newNumber = ((alert.textFields?.first)! as UITextField).text else {
                return
            }
            if newNumber != "" {
                var number = Int(newNumber)!
                var listString = ""
                if number == 0 {
                    if sender.tag == 1 {
                        self.listA.append(0)
                    } else {
                        self.listB.append(0)
                    }
                    listString = "0"
                }
                while(number%10 > 0){
                    if sender.tag == 1 {
                        self.listA.append(number%10)
                    } else {
                        self.listB.append(number%10)
                    }
                    if listString == "" {
                        listString = "\(number%10)"
                    } else {
                        listString = "\(listString), \(number%10)"
                    }
                    number = number/10
                }
                if sender.tag == 1 {
                    self.listALbl.text = "Input List A: [\(listString)]"
                } else {
                    self.listBLbl.text = "Input List B: [\(listString)]"
                }
                //
            }
//            self.outputSetting()
            if self.listA.isEmpty {
                self.listSumLbl.text = "Output: ListA is empty."
                return
            }
            if self.listB.isEmpty{
                self.listSumLbl.text = "Output: ListB is empty."
                return
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
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
