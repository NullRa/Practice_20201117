//
//  ViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModel!

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
        viewModel = ViewModel()
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
        let cellTitle = viewModel.getCellTitle(index: indexPath.row)
        cell?.textLabel?.text = cellTitle
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let twoSumVC = storyboard?.instantiateViewController(withIdentifier: "TwoSumIdentify") as? TwoSumViewController {
                navigationController?.pushViewController(twoSumVC, animated: true)
//                page2VC.page2ViewModel = Page2ViewModel(apiDatas: apiData)
            }
        default:
            print("default")
        }
    }

}
