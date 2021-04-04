# Azure theme for ttk

![image](https://github.com/rdbende/Azure-ttk-theme/blob/main/Azure%20screenshot.png)
![image](https://github.com/rdbende/Azure-ttk-theme/blob/main/Azure-dark%20screenshot.png)

## Usage (tkinter)
To use the theme just create a style, import the **azure.tcl**, or the **azure-dark.tcl** file, and call the `theme_use` method to set the theme:
```python
# Create a style
style = ttk.Style(root)

# Import the tcl file
root.tk.call('source', 'azure.tcl / azure-dark.tcl')

# Set the theme with the theme_use method
style.theme_use('azure / azure-dark')
```

## New style elements
Azure theme has a style for every ttk widget, but there are some **new** widget styles, such as an accent button, toggle switch, and toggle button. You can apply these with the style option

If you need a highlighted button, use AccentButton:
```python
button = ttk.Button(root, text='AccentButton', style='AccentButton', command=callback)
```
To create a ToggleButton you need a checkbutton, to which you can apply the `ToggleButton` style:
```python
togglebutton = ttk.Checkbutton(root, text='ToggleButton', style='ToggleButton', variable=var)
```
The use of switches is becoming more common these days, so this theme has a toggle switch style, that can be applied to checkbuttons:
```python
switch = ttk.Checkbutton(root, text='Switch', style='Switch', variable=var)
```

## A short example
```python
import tkinter as tk
from tkinter import ttk

root = tk.Tk()

# Create a style
style = ttk.Style(root)

# Import the tcl file
root.tk.call('source', 'azure.tcl')

# Set the theme with the theme_use method
style.theme_use('azure')

# A themed button
button = ttk.Button(root, text='I\'m a themed button')
button.pack(pady=20)

root.mainloop()
```

## Warnings:
- If you don't use Windows, the default font for tkinter (`TkDefaultFont`) can be a bit ugly in the theme, so I recommend to you use [`tkextrafont`](https://github.com/TkinterEP/python-tkextrafont), which is great if you want to use an `.ttf` file without installing (the theme uses Arial)
- Performance issue:
If you put a widget inside a `LabelFrame`, the hover rendering can be extra slow (the same goes for `Notebook`)

## Design - inspired by Microsoft's [Fluent](https://www.microsoft.com/design/fluent/) design
- Flat, rounded elements, high contrast
- Colors: **blue** `#007fff` `#3398ff`, **gray** `#e6e6e6` `#cccccc` `#999999` `#737373`  `#333333` and of course `#ffffff` `#000000`  `#ff0000`


