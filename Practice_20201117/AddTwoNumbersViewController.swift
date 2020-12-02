//
//  AddTwoNumbersViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/30.
//

import UIKit

class AddTwoNumbersViewController: UIViewController {
    var addTwoNumbersViewModel: AddTwoNumbersViewModel!

    @IBOutlet weak var listALbl: UILabel!
    @IBOutlet weak var listABtn: UIButton!
    @IBOutlet weak var listBLbl: UILabel!
    @IBOutlet weak var listBBtn: UIButton!
    @IBOutlet weak var listSumLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bind()
    }
    func initUI(){
        self.title = "AddTwoNumbers"
    }
    func bind(){
        addTwoNumbersViewModel = AddTwoNumbersViewModel()
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
                let number = Int(newNumber)!
                let list: ListType = sender.tag == 1 ? ListType.listA : ListType.listB

                let listString = self.addTwoNumbersViewModel.setListAndGetString(list: list, newNumber: number)
                if sender.tag == 1 {
                    self.listALbl.text = listString
                } else {
                    self.listBLbl.text = listString
                }
            }
            self.listSumLbl.text = self.getOutPutString()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
    func getOutPutString() -> String{
        let result = addTwoNumbersViewModel.checkListIsNil()
        switch result {
        case .listA:
            return "Output: ListA is empty."
        case .listB:
            return "Output: ListB is empty."
        default:
            if let outputString = self.addTwoNumbersViewModel.addTwoNumbers()?.showListString() {
                return "Output: [\(outputString)]."
            }
        }
        self.alertMessage(title: "ERROR", message: nil)
        return "ERROR"
    }
}
