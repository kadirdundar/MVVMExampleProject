//
//  RickyMortyVC.swift
//  mvvmExample
//
//  Created by Kadir Dündar on 8.03.2023.
//

import UIKit
import SnapKit

final class RickyMortyVC: UIViewController {
    private let labelTitle: UILabel = UILabel()
    private let box : UIView = UIView()
    private let inducator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      configure()
    }
    func configure(){
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(inducator)
        
        drawDesign()
        
        makeBox()
        makeLabel()
        makeIndicator()
        
     
    }
    func drawDesign(){
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.box.backgroundColor = .red
            self.labelTitle.text = "hoşgeldiniz"
            self.inducator.color = .red
        }
        inducator.startAnimating()
    }
    

}
extension RickyMortyVC {
    
    private func makeBox ( ) {
        box.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset (5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }}
    func makeLabel() {
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo (view.safeAreaLayoutGuide.snp.top) .offset (10)
            make.left.equalTo(view).offset (10)
            make.right.equalTo (view).offset (-10)
            make.height.greaterThanOrEqualTo (10)
        }}
    
    func makeIndicator() {
        inducator.snp.makeConstraints { (make) in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}
