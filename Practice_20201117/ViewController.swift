//
//  ViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {

    var cellTitleList = ["1. Two Sum"]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
        bind()
    }

    func initUI(){

    }

    func bind(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = self.cellTitleList[indexPath.row]
        return cell!
    }

}
