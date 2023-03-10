//
//  RickyMortyTableViewCell.swift
//  mvvmExample
//
//  Created by Kadir Dündar on 10.03.2023.
//

import UIKit
import Alamofire
class RickyMortyTableViewCell: UITableViewCell {
    
    private let customImage: UIImageView = UIImageView()
    private let title: UILabel = UILabel()
    private let customDescription: UILabel = UILabel()
    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    enum Identifier: String {
        case custom = "vb10"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(customImage)
        addSubview(title)
        addSubview(customDescription)
        title.font = .boldSystemFont(ofSize: 18)
        customDescription.font = .italicSystemFont(ofSize: 10)
        
        customImage.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        title.snp.makeConstraints { (make) in
            make.top.equalTo(customImage.snp.bottom).offset(10)
            make.right.left.equalTo(contentView)
        }

        customDescription.snp.makeConstraints { (make) in
            make.top.equalTo(title).offset(5)
            make.right.left.equalTo(title)
            make.bottom.equalToSuperview()
        }
    }
    
    
    func saveModel(model: Result) {
        title.text = model.name
        customDescription.text = model.status
        
        if let imageUrlString = model.image, let imageUrl = URL(string: imageUrlString) {
            AF.download(imageUrl).responseData { response in
                if let data = response.value, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.customImage.image = image
                    }
                }
            }
        }
    }
    
}
