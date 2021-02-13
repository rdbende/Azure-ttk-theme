# Azure theme for ttk

![image](https://github.com/rdbende/Azure-ttk-theme/blob/main/azure/screenshot.png)

![image](https://github.com/rdbende/Azure-ttk-theme/blob/main/azure%20dark/screenshot.png)

#### Azure theme is a beautiful modern ttk theme inspired by Microsoft's fluent design.

## Usage (tkinter)
To use the theme just create a style, import the **azure.tcl** file, and call the set_theme command to set the theme:
```bash
style = ttk.Style(root)
root.tk.call('source', 'azure.tcl')
style.theme_use('azure')
```

## New style elements
Azure theme has a style for every ttk widget, but there are some new widget styles, such as an accent button, toggle switch, and toggle button. You can apply these with the style option

To create an accent button:
```bash
button = ttk.Button(root, text='Accent button', style='Accentbutton')
```
To create a toggle button you need a checkbutton, to which you can apply the style:
```bash
togglebutton = ttk.Checkbutton(root, text='Toggle button', style='Togglebutton', variable=var, onvalue=1)
```
The use of switches is becoming more common these days, so this theme has a toggle switch style, that can be applied to checkbuttons:
```
switch = ttk.Checkbutton(root, text='Switch', style='Switch', variable=var, onvalue=1)
```

## Design
- Flat, rounded elements, high contrast
- Colors: **blue** `#007fff` `#3398ff` and **gray** `#e6e6e6` `#cccccc` `#737373` `#999999` `#333333`
- This theme, unlike many other themes, uses the tk_setPalette procedure to set the background color of the window and the colors of other tkinter widgets.

*It's a png-based theme, so like other third-party themes, it's relatively slow*
