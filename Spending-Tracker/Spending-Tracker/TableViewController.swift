//
//  TableViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 13/06/1443 AH.
//

import UIKit

enum Explane : String  {
    
    case anniutyExplame
    case laveregeExplame
    case doubleExplame
    case simpleExplame
    case compoundExplame
    case cashFlowExplame
    case budgetExplame
    
}


struct ExplaneData {

    var name = String()
    var data = String()

}



class TableViewController: UITableViewController {

    var ArryOfCalculate: [Explane] = [.anniutyExplame,.laveregeExplame,.doubleExplame,.simpleExplame,.compoundExplame,.cashFlowExplame,.budgetExplame]
    var annunity = ExplaneData(name: "", data: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return ArryOfCalculate.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.text = NSLocalizedString("An annuity is a series of payments made at equal intervals. Examples of annuities are regular deposits to a savings account, monthly home mortgage payments, monthly insurance payments and pension payments. Annuities can be classified by the frequency of payment dates. The payments (deposits) may be made weekly, monthly, quarterly, yearly, or at any other regular interval of time. Annuities may be calculated by mathematical functions known as annuity functions.An annuity which provides for payments for the remainder of a person's lifetime is a life annuity.", comment: "")
            
            return cell
        }else if (indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.text = NSLocalizedString("What it is: The leverage ratio compares debt to income. Total debts and liabilities are debts like student loans, mortgages, auto loansHow to use it: Aim for the lowest leverage ratio you can. Anything less than one is excellent, since you could pay off every debt with your income in one period.Best for: Measuring your liquidity and determining whether you can afford to take out a loan. A common rule of thumb says that your leverage ratio (including mortgage, car loans, etc.) should be no more than 33 percent of your income.Leverage ratio = (total liabilities + total debts)/total income liabilities/debts: student loans, mortgages, etc.", comment: "")
            return cell

        }else if(indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.text = NSLocalizedString("What it is: This tells you how many years it will take to double your money", comment: "")
            return cell

        }else if(indexPath.section == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.text = NSLocalizedString("What it is: Simple interest is interest earned from principal.Note that this calculation gives you the principal + interest. To calculate just the interest, take the calculation from the previous screen and subtract the principal from that number.How to use it: This calculation can be done quickly to provide an idea of how much interest will accrue over time. Just remember: This equation ignores the effects of compounding.Best for: A rough estimate on what you'll earn in a savings account, or pay on a loan or a credit card. ", comment: "")
            return cell

            
        }else if(indexPath.section == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.text = NSLocalizedString("What it is: The compound interest is the interest earned on the principal, and any interest accrued in the past. *Note that this calculation gives you the principal + interest. To calculate just the interest, take the calculation from the previous screen and subtract the principal from that number.How to use it: Use this formula instead of the simple interest equation to get a more precise number for how much interest will accrue.Best for: Determining how much actual interest you will earn over time on an investment or pay on a debt.", comment: "")
            return cell

        }else if(indexPath.section == 5){
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.text = NSLocalizedString("What it is: Cash flow shows how much you earn in relation to how much you spend.", comment: "")
            return cell

        }else if(indexPath.section == 6){
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.text = NSLocalizedString("What it is: Cash flow shows how much you earn in relation to how much you spend.How to use it: See whether or not you're living within your means. If the number is negative, you're spending too much; if it's positive, put the leftover money in savings.Best for: Figuring out where to tighten your budget.", comment: "")
            return cell

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            
            return cell

        }
             
            
        }
         

       
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */






