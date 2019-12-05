//
//  ViewController.swift
//  XebiaTest
//
//  Created by mojave on 05/12/19.
//  Copyright © 2019 Jagandeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var viewModel = NYMostPopularViewModel()
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.accessibilityIdentifier = "Onboarding View"
        
        viewModel.delegate = self
        viewModel.getNews(type: .oneDay)
    }
    
    func showAlertView(message:String)  {
        let alert = UIAlertController(title: "New York Times API", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.newsTableView.accessibilityIdentifier = "news table"
    }
}

extension ViewController:ViewModelDelegate{
    func reloadTable(type: Int) {
        switch type {
        case 1:
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        default:
            DispatchQueue.main.async {
                self.showAlertView(message: "Api request failed")
            }
        }
        
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataItems?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.stringRepresentation) as! NewsTableViewCell
        if viewModel.dataItems?.results?.count ?? 0 > 0 {
                   let dataItems = viewModel.dataItems?.results![indexPath.row]
                   cell.configure(whitViewModel: dataItems!, row: indexPath.row)
               }
               return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(AppConstants.NewsTableView.heightForRow)
    }
    
}

