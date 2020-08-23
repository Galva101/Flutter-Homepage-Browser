# Flutter-Homepage-Browser

This app is designed to allow the user to browse a website of a business or service, and it provides floating action buttons to ensure that a user is not lost in the navigation.


## Features

1. ```flutter webview``` is used to load the website inside a ```SafeArea``` in order to maximise screen usage
2. A ```Stack``` is used inside a ternary operator to load a ```Circular Progress Indicator``` above the ```WebView```, such that during loading times of new pages, the user can see that the app is processing data.
3. The ```WebView``` has two functions: ```onPageStarted``` and ```onPageFinished```, that allow the ```Circular Progress Indicator``` from point 2 to be toggled automatically, and also if any other websites inside the ```WebView``` are loaded, not just the ones originating from the ```Floating Action Buttons```
4. 3 ```Floating Action Buttons``` hover along the bottom edge of the screen, in order to not obscure the website below, and they are always present for the user's ease of use.
5. ```WillPopScope``` is used to prevent the exit via the back button, as this can cause the app to crash.
