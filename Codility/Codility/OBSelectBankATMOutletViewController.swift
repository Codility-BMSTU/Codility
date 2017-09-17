//
//  SelectBankATMOutletViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit

class OBSelectBankATMOutletViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var fullATMDataSource:[BankATM] = [BankATM]()
    var ATMDataSource:[BankATM] = [BankATM]()
    
    var fullOutletDataSource:[BankOutlet] = [BankOutlet]()
    var OutletDataSource:[BankOutlet] = [BankOutlet]()
    override func viewDidLoad() {
        super.viewDidLoad()


        
        fullATMDataSource = BankATM.getTestData()
        ATMDataSource = fullATMDataSource
        fullOutletDataSource = BankOutlet.getTestData()
        OutletDataSource = fullOutletDataSource
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
     }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0){
            return ATMDataSource.count
        }
        else{
            return OutletDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ATMCell") as! BankATMCell
            cell.adress.text = "Адрес: " + ATMDataSource[indexPath.row].adress!
            cell.timetable.text = "Время работы: " + ATMDataSource[indexPath.row].timetable!
            cell.distance.text = "Расстояние: " + "\(ATMDataSource[indexPath.row].distance!)"
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OutletCell") as! BankOutletCell
            cell.adress.text = "Адрес: " + OutletDataSource[indexPath.row].adress!
            cell.timetable.text = "Время работы: " + OutletDataSource[indexPath.row].timetable!
            cell.distance.text = "Расстояние: " + "\(OutletDataSource[indexPath.row].distance!)"
            cell.workloadIcon.layer.cornerRadius = 10
            cell.workloadIcon.clipsToBounds = true
            var workloadText = "Загруженность: "
            switch OutletDataSource[indexPath.row].workload! {
            case 0:
                workloadText+="низкая"
                cell.workloadIcon.backgroundColor = UIColor.green
                break
            case 1:
                cell.workloadIcon.backgroundColor = UIColor.yellow
                workloadText+="средняя"
                break
            case 2:
                cell.workloadIcon.backgroundColor = UIColor.red
                workloadText+="высокая"
            default: break
            }
            cell.workload.text = workloadText
            return cell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0){
            return "Банкоматы"
        }else{
            return "Отделения"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section==0){
            return CGFloat(98.0)
        }else{
            return CGFloat(125.0)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.section==1){
            self.performSegue(withIdentifier: "toChooseService", sender: OutletDataSource[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
       return false 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChooseService"{
            let destViewController = segue.destination as! OBChooseServiceViewController
            destViewController.fullDataSource = (sender as! BankOutlet).services!
        }
    }
    
    @IBAction func goBack(_ sender: OBBackBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
