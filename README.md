# Azure theme for ttk

![image](https://github.com/rdbende/Azure-ttk-theme/blob/main/Azure%20screenshot.png)
![image](https://github.com/rdbende/Azure-ttk-theme/blob/main/Azure-dark%20screenshot.png)

## How to use
### Python / tkinter
To use the theme just import the **azure.tcl**, or the **azure-dark.tcl** file, and call the `theme_use` method to set the theme:
```python
# Import the tcl file
root.tk.call('source', 'azure.tcl / azure-dark.tcl')

# Set the theme with the theme_use method
ttk.Style().theme_use('azure / azure-dark')
```

### Tcl / tk
To use the theme just import the **azure.tcl**, or the **azure-dark.tcl** file, and call the `theme use` method to set the theme:
```tcl
# Import the tcl file
source "azure.tcl / azure-dark.tcl"

# Set theme using the theme use method
ttk::style theme use azure / azure-dark
```



## New style elements
The Azure theme has a style for every ttk widget, but there are some **new** widget styles, such as an accent button, toggle switch, and toggle button. You can apply these with the `style` option

If you need a highlighted button, use `AccentButton`:
```python
button = ttk.Button(root, text='AccentButton', style='AccentButton', command=callback)
```
To create a ToggleButton you need a checkbutton, because we need a two-state widget, to which you can apply the `ToggleButton` style:
```python
togglebutton = ttk.Checkbutton(root, text='ToggleButton', style='ToggleButton', variable=var)
```
The use of switches is becoming more common these days, so this theme has a `Switch` style, that can be applied to checkbuttons:
```python
switch = ttk.Checkbutton(root, text='Switch', style='Switch', variable=var)
```

## A short example
for Python...
```python
import tkinter as tk
from tkinter import ttk

root = tk.Tk()

# Import the tcl file
root.tk.call('source', 'azure.tcl')

# Set the theme with the theme_use method
ttk.Style().theme_use('azure')

# A themed (ttk) button
button = ttk.Button(root, text="I'm a themed button")
button.pack(pady=20)

root.mainloop()
```
...and for Tcl
```tcl
package require Tk 8.6

# Import the tcl file
source "azure.tcl"

# Set theme using the theme use method
ttk::style theme use azure

# A themed (ttk) button
ttk::button .button -text "I'm a themed button"
pack .button -pady 20
```

## Performance issue:
If you put a widget inside a `LabelFrame`, the hover rendering can be extra slow (the same goes for `Notebook`), I am working on the solution
