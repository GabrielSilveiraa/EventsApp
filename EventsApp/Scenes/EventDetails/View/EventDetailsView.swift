//
//  EventDetailsView.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 13/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit
import Kingfisher
final class EventDetailsView: BaseView {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    let eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.kf.indicatorType = .activity
        return imageView
    }()
    let dateLabel: UILabel = {
        let label = UILabel(fontType: .bold, size: 20)
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel(fontType: .bold, size: 18)
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    let shareButton: UIButton = {
        let button = UIButton()
        button.setupAppearance()
        button.setTitle("shareButtonTitle".localized, for: .normal)
        return button
    }()
    let checkinButton: UIButton = {
        let button = UIButton()
        button.setupAppearance()
        button.setTitle("checkinButtonTitle".localized, for: .normal)
        return button
    }()
    let mapsButton: UIButton = {
        let button = UIButton()
        button.setupAppearance()
        button.setTitle("mapsButtonTitle".localized, for: .normal)
        return button
    }()
    
    override func initialize() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(eventImageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(shareButton)
        contentView.addSubview(checkinButton)
        contentView.addSubview(mapsButton)
    }
    
    override func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupEventImageViewConstraints()
        setupDateLabel()
        setupPriceLabel()
        setupDescriptionLabel()
        setupShareButton()
        setupCheckinButton()
        setupMapsButton()
    }
    
    private func setupScrollViewConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    private func setupContentViewConstraints() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    private func setupEventImageViewConstraints() {
        eventImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    
    private func setupDateLabel() {
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(eventImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func setupPriceLabel() {
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func setupShareButton() {
        shareButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(40)
        }
    }
    
    private func setupCheckinButton() {
        checkinButton.snp.makeConstraints {
            $0.top.equalTo(shareButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(40)
        }
    }
    
    private func setupMapsButton() {
        mapsButton.snp.makeConstraints {
            $0.top.equalTo(checkinButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
