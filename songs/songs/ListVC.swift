//
//  ListVC.swift
//  songs
//
//  Created by Mariam on 10/9/20.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
     var items: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items.songs[indexPath.row].songName
        cell.imageView?.image = UIImage(named: items.songs[indexPath.row].songImage)
        cell.textLabel?.font = UIFont(name: "helvetica", size: 30)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerVC else {
            return
    }
        vc.song = items.songs[indexPath.row]
        vc.position = position
        present(vc, animated: true)
}
}


