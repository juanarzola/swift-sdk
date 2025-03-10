//
//  Copyright © 2021 Iterable. All rights reserved.
//

import UIKit

protocol InboxViewControllerViewModelProtocol {
    var view: InboxViewControllerViewModelView? { get set }
    var unreadCount: Int { get }
    var numSections: Int { get }
    var inboxSessionId: String? { get }
    
    // Talks to the server and refreshes
    // this works hand in hand with listener.onViewModelChanged.
    // Internal model can't be changed until the view begins update (tableView.beginUpdates()).
    func refresh() -> Pending<Bool, Error>
    
    func handleClick(clickedUrl url: URL?, forMessage message: IterableInAppMessage)
    
    func set(comparator: ((IterableInAppMessage, IterableInAppMessage) -> Bool)?,
             filter: ((IterableInAppMessage) -> Bool)?,
             sectionMapper: ((IterableInAppMessage) -> Int)?)
    
    func isEmpty() -> Bool
    func numRows(in section: Int) -> Int
    func set(read: Bool, forMessage message: InboxMessageViewModel)
    func message(atIndexPath indexPath: IndexPath) -> InboxMessageViewModel
    func remove(atIndexPath indexPath: IndexPath)
    
    func viewWillAppear()
    func viewWillDisappear()
    func visibleRowsChanged()
    func beganUpdates()
    func endedUpdates()
}
