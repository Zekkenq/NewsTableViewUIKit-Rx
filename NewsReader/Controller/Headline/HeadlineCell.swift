import UIKit

final class HeadlineCell: UITableViewCell {
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        HeadlineCell.initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let titleLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    private let bylineLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        return view
    }()
    
    private let sectionLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        return view
    }()

    func initialize(with viewModel: TopStoryHeadline){
       
        titleLabel.text = viewModel.title
        bylineLabel.text = viewModel.byline
        sectionLabel.text = viewModel.section
        
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 24)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
        ])
        
        contentView.addSubview(sectionLabel)
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            sectionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        contentView.addSubview(bylineLabel)
        bylineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bylineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bylineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bylineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
    }
}
