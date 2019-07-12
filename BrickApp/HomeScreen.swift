

import UIKit


class HomeScreen: UIViewController {
    

    let topImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(named: "top")
        imageview.contentMode = .scaleToFill
        return imageview
    }()
    
    let noobButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.setTitle("Noob", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    let easyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.setTitle("Easy", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let hardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.setTitle("Hard", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    func setupLayout(){
        view.addSubview(topImageView)
        view.addSubview(easyButton)
        view.addSubview(hardButton)
        view.addSubview(noobButton)
        
        //topimage layout
        topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        noobButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noobButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        noobButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/5).isActive = true
        noobButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        noobButton.addTarget(self, action: #selector(noob_tap), for: .touchUpInside)

        //eastbutton layout
        easyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //easyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        easyButton.topAnchor.constraint(equalTo: noobButton.bottomAnchor , constant: 20).isActive = true
        easyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/5).isActive = true
        easyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        easyButton.addTarget(self, action: #selector(easy_tap), for: .touchUpInside)
        
        //hardbutton layout
        hardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hardButton.topAnchor.constraint(equalTo: easyButton.bottomAnchor , constant: 20).isActive = true
        hardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/5).isActive = true
        hardButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        hardButton.addTarget(self, action: #selector(hard_tap), for: .touchUpInside)
      

}
    @objc func noob_tap(){
        let newViewController = MainScreen()
        newViewController.cols = 1
        newViewController.rows = 1
        newViewController.time = 0.005
        self.present(newViewController, animated: true, completion: nil)
    }
    @objc func easy_tap(){
        let newViewController = MainScreen()
        newViewController.cols = 3
        newViewController.rows = 4
        newViewController.time = 0.003
        self.present(newViewController, animated: true, completion: nil)
    }
    @objc func hard_tap(){
        let nextViewController = MainScreen()
        nextViewController.cols = 5
        nextViewController.rows = 7
        nextViewController.time = 0.002
        self.present(nextViewController, animated: true, completion: nil)
    }
}
