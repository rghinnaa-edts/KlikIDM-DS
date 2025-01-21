//
//  HomeTabView.md
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 21/01/25.
//

HomeTabView
=============

`HomeTabView` is a custom `Tab` for IOS using SwiftUI that provides a three-tab layout with animated transitions and visual effects. It allows developers to create visually appealing tabs with smooth animations and delegate callbacks for tab selection changes.

* * * * *

Features
--------

-   **Three tabs**: Grocery, Food, and Virtual.

-   **Smooth animations**: Includes animations for tab selection, active button repositioning, and shape appearance changes.

-   **Delegate pattern**: Provides an action mechanism to notify when a tab is selected.

* * * * *

Preview
-------
![HPTL](https://res.cloudinary.com/dr6cm6n5f/image/upload/v1737437384/hometablayout_z8e7il.gif)

Installation
------------

### 1\. Add KlikIDMTab with value type and tabs:

``` KlikIDMTabs Example
KlikIDMTabs(
  type: KlikIDMTabs.TabType.homeNew,
  tabs: tabhome
)
```

- value 'type' is the Type of Tab. for HomeTabView, you can use **'KlikIDMTabs.TabType.homeNew**
- value 'tabs' is an Array of Tab model. you can use KlikIDMTabs.Tab(icon, title, badge) for Tab model.
  tabs example
  ``` tabs
  let tabs = [
    KlikIDMTabs.Tab(icon: "grocery", title: "Grocery", badge: ""),
    KlikIDMTabs.Tab(icon: "food", title: "Food", badge: ""),
    KlikIDMTabs.Tab(icon: "card", title: "Virtual", badge: "")
  ]
  ```

* * * * *

Usage
-----

### 1\. Declare variable of selectedTab in main view

```
@State private var selectedTab: Int = 0
```

### 2\. Add selectedTab and action per Item in KlikIDMTabs

The current tab is stored in the `homeTab` property:

```KlikIDMTabs Example
KlikIDMTabs(
  type: KlikIDMTabs.TabType.homeNew,
    tabs: tabhome,
    selectedTabHomeNew: $selectedTab,
    onTabSelected: { index in
      selectedTab = index
    }
)
```

### 3\. [Code Example](https://github.com/rghinnaa-edts/KlikIDM-DS/blob/main/KlikIDM-DS/View/Tabs/HomeTabView.swift)

