"""
Example script for testing the Azure theme
Author: rdbende
License: GNU GPLv2.1
"""

# Importing tkinter and tkinter.ttk
import tkinter as tk
from tkinter import ttk

# Create the window
root = tk.Tk()
root.title('Azure dark')

# Place the window in the center of the screen
windowWidth = 800
windowHeight = 530
screenWidth = root.winfo_screenwidth()
screenHeight = root.winfo_screenheight()
xCordinate = int((screenWidth/2) - (windowWidth/2))
yCordinate = int((screenHeight/2) - (windowHeight/2))
root.geometry("{}x{}+{}+{}".format(windowWidth, windowHeight, xCordinate, yCordinate))


### Here are the three lines by which we set the theme ###
# Create a style
style = ttk.Style(root)

# Import the tcl file
root.tk.call('source', 'azure-dark.tcl')

# Set the theme with the theme_use method
style.theme_use('azure-dark')


# Creating lists for the Comboboxes
optionList = ['', 'OptionMenu', 'Option 1', 'Option 2']
comboList = ['Combobox', 'Editable item 1', 'Editable item 2']
readonlyComboList = ['Readonly combobox', 'Item 1', 'Item 2']

# Create control variables
a = tk.BooleanVar()
b = tk.BooleanVar(value=True)
c = tk.BooleanVar()
d = tk.IntVar(value=2)
e = tk.StringVar(value=optionList[1])
f = tk.BooleanVar()
g = tk.DoubleVar(value=75.0)
h = tk.BooleanVar()

# Create a Frame for the Checkbuttons
checkframe = ttk.LabelFrame(root, text='Checkbuttons', width=210, height=200)
checkframe.place(x=20, y=12)

# Checkbuttons
check1 = ttk.Checkbutton(checkframe, text='Unchecked', variable=a)
check1.place(x=20, y=20)
check2 = ttk.Checkbutton(checkframe, text='Checked', variable=b)
check2.place(x=20, y=60)
check3 = ttk.Checkbutton(checkframe, text='Third state', variable=c)
check3.state(['alternate'])
check3.place(x=20, y=100)
check4 = ttk.Checkbutton(checkframe, text='Disabled', state='disabled')
check4.place(x=20, y=140)

# Create a Frame for the Radiobuttons
radioframe = ttk.LabelFrame(root, text='Radiobuttons', width=210, height=160)
radioframe.place(x=20, y=252)

# Radiobuttons
radio1 = ttk.Radiobutton(radioframe, text='Deselected', variable=d, value=1)
radio1.place(x=20, y=20)
radio2 = ttk.Radiobutton(radioframe, text='Selected', variable=d, value=2)
radio2.place(x=20, y=60)
radio3 = ttk.Radiobutton(radioframe, text='Disabled', state='disabled')
radio3.place(x=20, y=100)

# Separator
separator = ttk.Separator()
separator.place(x=20, y=235, width=210)

# Function for move the Progressbar when the Scale is moved
def scaleFunction(*args):
    g.set(scale.get())

# Scale
scale = ttk.Scale(root, from_=100, to=0, variable=g, command=scaleFunction)
scale.place(x=80, y=430)

# Progressbar
progress = ttk.Progressbar(root, value=0, variable=g, mode='determinate')
progress.place(x=80, y=480)

# Entry
entry = ttk.Entry(root)
entry.place(x=250, y=20)
entry.insert(0, 'Entry')

# Spinbox
spinbox = ttk.Spinbox(root, from_=0, to=100, increment=0.1)
spinbox.place(x=250, y=70)
spinbox.insert(0, 'Spinbox')

# Combobox
combobox = ttk.Combobox(root, values=comboList)
combobox.current(0)
combobox.place(x=250, y=120)

# Read-only combobox
readonlycombo = ttk.Combobox(root, state='readonly', values=readonlyComboList)
readonlycombo.current(0)
readonlycombo.place(x=250, y=170)

# Menu for the Menubutton
menu = tk.Menu(root, tearoff=False)
menu.add_command(label='Menu item 1')
menu.add_command(label='Menu item 2')
menu.add_separator()
menu.add_command(label='Menu item 3')
menu.add_command(label='Menu item 4')

# Menubutton
menubutton = ttk.Menubutton(root, text='Menubutton', menu=menu, direction='below')
menubutton.place(x=250, y=220)

# OptionMenu
optionmenu = ttk.OptionMenu(root, e, *optionList)
optionmenu.place(x=250, y=270)

# Button callback
def buttonFunction():
    print('Button callback')

# Button
button = ttk.Button(root, text='Button', command=buttonFunction)
button.place(x=250, y=320)

# AccentButton
accentbutton = ttk.Button(root, text='AccentButton', style='AccentButton', command=buttonFunction)
accentbutton.place(x=250, y=370)

# ToggleButton
togglebutton = ttk.Checkbutton(root, text='ToggleButton', style='ToggleButton', variable=f)
togglebutton.place(x=250, y=420)

# Switch
switch = ttk.Checkbutton(root, text='Switch on', style='Switch', variable=h)
switch.place(x=250, y=470)
switch.invoke()

# Function for configure the Switch's text when switched
def switchFunction():
    if h.get():
        switch.config(text='Switch on')
    else:
        switch.config(text='Switch off')
       
switch.config(command=switchFunction)

# Sizegrip
sizegrip = ttk.Sizegrip(root)
sizegrip.pack(padx=5, pady=5, side='bottom', anchor='se')

# Notebook
notebook = ttk.Notebook(root)

# Tab 1
notebookTab1 = ttk.Frame(notebook, width=335, height=150)
notebook.add(notebookTab1, text='Tab 1')

# Tab 2
notebookTab2 = ttk.Frame(notebook, width=335, height=150)
notebook.add(notebookTab2, text='Tab 2')

# Tab 3
notebookTab3 = ttk.Frame(notebook, width=335, height=150)
notebook.add(notebookTab3, text='Tab 3')

notebook.place(x=420, y=330)

# Create a Frame for the Treeview
treeFrame = ttk.Frame(root)
treeFrame.place(x=420, y=20)

# Scrollbar
treeScroll = ttk.Scrollbar(treeFrame)
treeScroll.pack(side='right', fill='y')

# Treeview
treeview = ttk.Treeview(treeFrame, selectmode="extended", yscrollcommand=treeScroll.set, columns=(1, 2), height=12)
treeview.pack()

treeScroll.config(command=treeview.yview)

# Treeview columns
treeview.column("#0", width=120)
treeview.column(1, anchor='w', width=100)
treeview.column(2, anchor='w', width=100)

# Treeview headings
treeview.heading("#0", text="Treeview", anchor='center')
treeview.heading(1, text="Column 1", anchor='center')
treeview.heading(2, text="Column 2", anchor='center')

# Insert data into Treeview
treeview.insert(parent='', index='end', iid=1, text="Parent", values=("Item 1", "Value 1"))
treeview.item(1, open=True)
treeview.insert(parent=1, index='end', iid=2, text="Child", values=("Subitem 1.1", "Value 1.1"))
treeview.insert(parent=1, index='end', iid=3, text="Child", values=("Subitem 1.2", "Value 1.2"))
treeview.insert(parent=1, index='end', iid=4, text="Child", values=("Subitem 1.3", "Value 1.3"))
treeview.insert(parent=1, index='end', iid=5, text="Child", values=("Subitem 1.4", "Value 1.4"))
treeview.insert(parent='', index='end', iid=6, text="Parent", values=("Item 2", "Value 2"))
treeview.item(6, open=True)
treeview.insert(parent=6, index='end', iid=13, text="Child", values=("Subitem 2.1", "Value 2.1"))
treeview.insert(parent=6, index='end', iid=7, text="Sub-parent", values=("Subitem 2.2", "Value 2.2"))
treeview.item(7, open=True)
treeview.insert(parent=7, index='end', iid=8, text="Child", values=("Subitem 2.2.1", "Value 2.2.1"))
treeview.insert(parent=7, index='end', iid=9, text="Child", values=("Subitem 2.2.2", "Value 2.2.2"))
treeview.selection_set(9)
treeview.insert(parent=7, index='end', iid=10, text="Child", values=("Subitem 2.2.3", "Value 2.2.3"))
treeview.insert(parent=6, index='end', iid=11, text="Child", values=("Subitem 2.3", "Value 2.3"))
treeview.insert(parent=6, index='end', iid=12, text="Child", values=("Subitem 2.4", "Value 2.4"))
treeview.insert(parent='', index='end', iid=14, text="Parent", values=("Item 3", "Value 3"))
treeview.item(14, open=True)
treeview.insert(parent=14, index='end', iid=15, text="Child", values=("Subitem 3.1", "Value 3.1"))
treeview.insert(parent=14, index='end', iid=16, text="Child", values=("Subitem 3.2", "Value 3.2"))
treeview.insert(parent=14, index='end', iid=17, text="Child", values=("Subitem 3.3", "Value 3.3"))
treeview.insert(parent=14, index='end', iid=18, text="Child", values=("Subitem 3.4", "Value 3.4"))
treeview.insert(parent='', index='end', iid=19, text="Parent", values=("Item 4", "Value 4"))
treeview.item(19, open=True)
treeview.insert(parent=19, index='end', iid=20, text="Child", values=("Subitem 4.1", "Value 4.1"))
treeview.insert(parent=19, index='end', iid=21, text="Sub-parent", values=("Subitem 4.2", "Value 4.2"))
treeview.item(21, open=True)
treeview.insert(parent=21, index='end', iid=22, text="Child", values=("Subitem 4.2.1", "Value 4.2.1"))
treeview.insert(parent=21, index='end', iid=23, text="Child", values=("Subitem 4.2.2", "Value 4.2.2"))
treeview.insert(parent=21, index='end', iid=24, text="Child", values=("Subitem 4.2.3", "Value 4.2.3"))
treeview.insert(parent=19, index='end', iid=25, text="Child", values=("Subitem 4.3", "Value 4.3"))


# And of course the mainloop
root.mainloop()