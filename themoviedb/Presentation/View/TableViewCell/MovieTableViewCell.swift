//
//  MovieTableViewCell.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        
        addSubview(movieImageView)
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(releaseDateLabel)
        
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 50),
            movieImageView.heightAnchor.constraint(equalToConstant: 50),
            
            verticalStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate.description
        movieImageView.image = UIImage(systemName: "photo")
        if let url = movie.thumbnail {
            movieImageView.af.setImage(withURL: url)
        }
    }
}
