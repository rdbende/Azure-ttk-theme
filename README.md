# Azure theme for ttk

### Azure theme is a beautiful modern ttk theme inspired by Microsoft's fluent design.

![image](https://github.com/rdbende/Azure-ttk-theme/blob/main/azure/screenshot.png)

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
To create switches and toggle buttons you need a checkbutton, to which you can apply the toggle switch, and toggle button styles
```bash
togglebutton = ttk.Checkbutton(root, text='Toggle button', style='Togglebutton')


switch = ttk.Checkbutton(root, text='Switch', style='Switch')
```

### Design
This theme uses flat, rounded elements in blue `#007fff, #3398ff` and gray `#e6e6e6, #cccccc, #737373, #333333`\
> It's a png-based theme, so like other third-party themes, it's relatively slow
