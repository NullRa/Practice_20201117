//
//  AddTwoNumbersViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/30.
//

import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int){
        self.val = val
        self.next = nil
    }
    func showListString() -> String {
        var string = "\(val)"
        var nextNode = next
        while nextNode != nil {
            string = "\(string), \(nextNode!.val)"
            nextNode = nextNode?.next
        }
        return string
    }
}
class AddTwoNumbersViewController: UIViewController {
    var listA: ListNode?
    var listB: ListNode?

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
                if sender.tag == 1 {
                    self.listA = nil
                } else {
                    self.listB = nil
                }
                if number == 0 {
                    if sender.tag == 1 {
                        self.listA = ListNode(0)
                    } else {
                        self.listB = ListNode(0)
                    }
                }
                while(number%10 > 0 || number > 10){
                    if sender.tag == 1 {
                        if self.listA == nil {
                            self.listA = ListNode(number%10)
                        } else {
                            var a = self.listA
                            while a?.next != nil {
                                a = a?.next
                            }
                            a?.next = ListNode(number%10)
                        }
                    } else {
                        if self.listB == nil {
                            self.listB = ListNode(number%10)
                        } else {
                            var b = self.listB
                            while b?.next != nil {
                                b = b?.next
                            }
                            b?.next = ListNode(number%10)
                        }
                    }
                    number = number/10
                }
                if sender.tag == 1 {
                    self.listALbl.text = "Input List A: [\(self.listA?.showListString() ?? "ERROR")]"
                } else {
                    self.listBLbl.text = "Input List B: [\(self.listB?.showListString() ?? "ERROR")]"
                }
            }
            if self.listA == nil {
                self.listSumLbl.text = "Output: ListA is empty."
                return
            }
            if self.listB == nil{
                self.listSumLbl.text = "Output: ListB is empty."
                return
            }

            guard let outputString = self.addTwoNumbers()?.showListString() else {
                self.alertMessage(title: "ERROR", message: nil)
                return
            }
            self.listSumLbl.text = "Output: [\(outputString)]."

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }

    func addTwoNumbers() -> ListNode? {
        var listATail = listA
        var listBTail = listB
        var head: ListNode? = nil
        var tail: ListNode? = nil
        var carry = 0
        while listATail != nil || listBTail != nil {
            let sum = (listATail?.val ?? 0) + (listBTail?.val ?? 0) + carry
            carry = sum/10
            let val = sum%10
            let node = ListNode(val)
            if head == nil {
                head = node
            } else {
                tail?.next = node
            }
            tail = node
            listATail = listATail?.next
            listBTail = listBTail?.next
        }
        if carry != 0 {
            tail?.next = ListNode(carry)
        }
        return head
    }
}
