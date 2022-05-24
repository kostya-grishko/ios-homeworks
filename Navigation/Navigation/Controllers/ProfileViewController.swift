
import UIKit

class ProfileViewController: UIViewController {
    
    public var postArray: [Post] = Post.uploadPosts()
    
    lazy var postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        postTableViewSetup()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    private func postTableViewSetup() {
        view.addSubview(postTableView)
        
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(postArray[indexPath.row])
        cell.likeButton.tag = indexPath.row
        cell.delegate = self
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        240
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProfileViewController: PostTableViewCellDelegate {
    func buttonPressed(cell: PostTableViewCell, AtIndex: Int, isButtonLiked: Bool) {
        isButtonLiked ? (postArray[AtIndex].likes! += 1) : (postArray[AtIndex].likes! -= 1)
        cell.likeLabel.text = String(describing: postArray[AtIndex].likes!)
    }
}

