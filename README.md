# UIKit-Combine

## Introduction
This project adds simple extensions to enable UIKit elements to be used with Combine APIs.

## How to Use
Add the package to the iOS repo and use publishers for specific controls instead of legacy delegate patterns.

### Example

#### UIControl
```
button.onTouchUpInside.sink { _ in 
    ...
}
```

#### UITableView
Create a `TableViewManager` instance to use with TableView instead of legacy `dataSource` and `delegate` patterns.

```
let manager = TableViewManager(withTableView: tableview)
```

##### dataSource
`dataSource` introduces a `.build()` method to handle replace legacy dataSource methods.

```
manager.build(
    rowsInSection: { Section in 
        // Replaces `numberOfRows:inSection:`
        ...
    } cellBuilder: { indexPath in 
        // Replaces `cellForRow:atIndexPath:`
        ...
    }
    ...
)
```

##### delegate
`delegate` introduces `actions` and `publishers` to handle appropriate events.

```
manager.actions { indexpath in
    indexpath.row == 0 ? 150.0 : 50.0
} editingStyleForRow: { indexpath in
    .none
}

manager.onDidSelectItem.sink { indexpath in
    ...
}
.store(in: &cancellables)
```
