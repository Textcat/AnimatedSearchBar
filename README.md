##About 
AnimatedSearchBar is an animated Search Bar, stretch out and in according to editing state.
![](https://github.com/luiyezheng/AnimatedSearchBar/blob/master/animatetete.gif)

##feature
* Animated Search Bar, stretch out and in according to editing state
* Custom the outline color and the animate duration
* Build Search Bar directly from attribute Inspector

##Installation 

###Manually
Open the **Source** folder, drag `AnimatedSearchBar.swift` into your project, drag `search.imageset` and `search1.imageset1` to your project Asset.

##Usage
###Build Search Bar Programmatically
```
let bar  = AnimatedSearchBar(frame: CGRectZero, duration: 3.0, outlineColor: UIColor.blackColor())
//Set animate duration to 3.0
//Set outline Color of SearchBar to black
```
Or
```
let bar = AnimatedSearchBar(frame: CGRectZero)
//duration will be 0.45
//outlineColor will be black
```
###Build from Storyboard
Create a search Bar from storybaord, subclass it to `AnimatedSearchBar`.

![](https://github.com/luiyezheng/AnimatedSearchBar/blob/master/Inspector1.png)

Custom it from attribute Inspector

![](https://github.com/luiyezheng/AnimatedSearchBar/blob/master/inspector2.png)

###Delegaet
One more step to get start, implement `func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool` in your viewController class
```
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        if let bar = searchBar as? AnimatedSearchBar {
            if bar.searchField.hidden {
                return false
            }
        }

        return true
    }
```
###reSet
Call `reSet()` to reset the state of AnimatedSearchBar
```
bar.reSet()
```

##License
The MIT License (MIT)

Copyright (c) 2015 luiyezheng

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

