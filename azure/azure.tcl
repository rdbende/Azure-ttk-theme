# Copyright (c) 2021 rdbende <rdbende@gmail.com>

# Azure theme is a beautiful modern ttk theme inspired by Microsoft's fluent design.

package require Tk 8.6

namespace eval ttk::theme::azure {

    variable version 0.1
    package provide ttk::theme::azure $version
    variable colors
    array set colors {
        -fg             "#000000"
        -bg             "#ffffff"
        -disabledfg     "#737373"
        -disabledbg     "#ffffff"
        -selectfg       "#000000"
        -selectbg       "#cccccc"
    }

    # I took this function from the arc theme of the Sergei Golovan.
    proc LoadImages {imgdir} {
        variable I
        foreach file [glob -directory $imgdir *.png] {
            set img [file tail [file rootname $file]]
            set I($img) [image create photo -file $file -format png]
        }
    }

    LoadImages [file join [file dirname [info script]] images]

    ttk::style theme create azure -parent default -settings {
        ttk::style configure . \
            -background $colors(-bg) \
            -foreground $colors(-fg) \
            -troughcolor $colors(-bg) \
            -focuscolor $colors(-selectbg) \
            -selectbackground $colors(-selectbg) \
            -selectforeground $colors(-selectfg) \
            -fieldbackground $colors(-selectbg) \
            -font TkDefaultFont \
            -borderwidth 1 \
            -relief flat

        ttk::style map . -foreground [list disabled $colors(-disabledfg)]


        # Layouts

        ttk::style layout TButton {
            Button.button -children {
                Button.padding -children {
                    Button.label -side left -expand true
                } 
            }
        }

        ttk::style layout Toolbutton {
            Toolbutton.button -children {
                Toolbutton.padding -children {
                    Toolbutton.label -side left -expand true
                } 
            }
        }

        ttk::style layout Accentbutton {
            Accentbutton.button -children {
                Accentbutton.padding -children {
                    Accentbutton.label -side left -expand true
                } 
            }
        }

        ttk::style layout TCheckbutton {
            Checkbutton.button -children {
                Checkbutton.padding -children {
                    Checkbutton.indicator -side left
                    Checkbutton.label -side right -expand true
                }
            }
        }


        ttk::style layout Switch {
            Switch.button -children {
                Switch.padding -children {
                    Switch.indicator -side left
                    Switch.label -side right -expand true
                }
            }
        }

        ttk::style layout Togglebutton {
            Togglebutton.button -children {
                Togglebutton.padding -children {
                    Togglebutton.label -side left -expand true
                } 
            }
        }

        ttk::style layout TRadiobutton {
            Radiobutton.button -children {
                Radiobutton.padding -children {
                    Radiobutton.indicator -side left
                    Radiobutton.label -side right -expand true
                }
            }
        }

        ttk::style layout Vertical.TScrollbar {
            Vertical.Scrollbar.trough -sticky ns -children {
                Vertical.Scrollbar.thumb -expand true
            }
        }

        ttk::style layout Horizontal.TScrollbar {
            Horizontal.Scrollbar.trough -sticky ew -children {
                Horizontal.Scrollbar.thumb -expand true
            }
        }

        ttk::style layout TLabelframe {
            Labelframe.border {
                Labelframe.padding -expand 1 -children {
                    Labelframe.label -side right
                }
            }
        }

        ttk::style layout Horizontal.TSeparator {
            Horizontal.separator -sticky nswe
        }

        ttk::style layout Vertical.TSeparator {
            Vertical.separator -sticky nswe
        }

        ttk::style layout TMenubutton {
            Menubutton.button -children {
                Menubutton.padding -children {
                    Menubutton.indicator -side right
                    Menubutton.label -side right -expand true
                }
            }
        }

        ttk::style layout TOptionMenu {
            OptionMenu.button -children {
                OptionMenu.padding -children {
                    OptionMenu.indicator -side right
                    OptionMenu.label -side right -expand true
                }
            }
        }

        ttk::style layout TCombobox {
            Combobox.field -children {
                Combobox.downarrow -side right -sticky {}
                Combobox.padding -expand 1 -children {
                    Combobox.textarea
                }
            }
        }

        ttk::style layout TSpinbox {
            Spinbox.field -children {
                null -side right -sticky {} -children {
                    Spinbox.uparrow -side top
                    Spinbox.downarrow -side bottom
                }
                Spinbox.padding -expand 0 -children {
                    Spinbox.textarea
                }
            }
        }

        ttk::style layout TNotebook.Tab {
            Notebook.tab -children {
                Notebook.padding -side top -children {
                    Notebook.label -side top -sticky {}
                }
            }
        }

        ttk::style layout Item {
            Treeitem.padding -sticky nswe -children {
                Treeitem.indicator -side left -sticky {} Treeitem.image -side left -sticky {} -children {
                    Treeitem.text -side left -sticky {}
                    }
                }
        }



        # Create widgets

        # Button
        ttk::style configure TButton -padding {8 4 8 4} -width -10 -anchor center

        ttk::style element create Button.button image \
            [list $I(button-basic) \
                {disabled pressed} $I(button-disabled) \
                disabled $I(button-disabled) \
                pressed $I(button-basic) \
                active $I(button-hover) \
            ] -border 4 -sticky ewns


        # Toolbutton
        ttk::style configure Toolbutton -padding {8 4 8 4} -width -10 -anchor center

        ttk::style element create Toolbutton.button image \
            [list $I(empty) \
                {disabled pressed} $I(button-disabled) \
                disabled $I(empty) \
                pressed $I(button-basic) \
                active $I(button-basic) \
            ] -border 4 -sticky ewns


        # Accentbutton
        ttk::style configure Accentbutton -padding {8 4 8 4} -width -10 -anchor center

        ttk::style element create Accentbutton.button image \
            [list $I(button-accent) \
                {disabled pressed} $I(button-disabled) \
                disabled $I(button-disabled) \
                pressed $I(button-accent) \
                active $I(button-accent-hover) \
            ] -border 4 -sticky ewns

        # Checkbutton
        ttk::style configure TCheckbutton -padding 4

        ttk::style element create Checkbutton.indicator image \
            [list $I(checkbox-unchecked) \
                {selected disabled} $I(checkbox-checked-disabled) \
                disabled $I(checkbox-unchecked-disabled) \
                {pressed alternate} $I(checkbox-third-state-active) \
                {active alternate} $I(checkbox-third-state-hover) \
                alternate $I(checkbox-third-state) \
                {pressed selected} $I(checkbox-checked-active) \
                {active selected} $I(checkbox-checked-hover) \
                selected $I(checkbox-checked) \
                {pressed !selected} $I(checkbox-unchecked-active) \
                active $I(checkbox-unchecked-hover) \
            ] -width 26 -sticky w

        # Switch
        ttk::style element create Switch.indicator image \
            [list $I(switch-off) \
                {selected disabled} $I(switch-on-disabled) \
                disabled $I(switch-off) \
                {pressed selected} $I(switch-on-hover) \
                {active selected} $I(switch-on-hover) \
                selected $I(switch-on) \
                {pressed !selected} $I(switch-off-hover) \
                active $I(switch-off-hover) \
            ] -width 46 -sticky w

        # Togglebutton
        ttk::style configure Togglebutton -padding {8 4 8 4} -width -10 -anchor center

        ttk::style element create Togglebutton.button image \
            [list $I(button-basic) \
                {selected disabled} $I(button-basic) \
                disabled $I(button-hover) \
                {pressed selected} $I(button-basic) \
                {active selected} $I(button-accent) \
                selected $I(button-accent) \
                {pressed !selected} $I(button-accent) \
                active $I(button-basic) \
            ] -border 4 -sticky ewns

        # Radiobutton
        ttk::style configure TRadiobutton -padding 4

        ttk::style element create Radiobutton.indicator image \
            [list $I(radio-unselected) \
                {selected disabled} $I(radio-selected-disabled) \
                disabled $I(radio-unselected-disabled) \
                {pressed selected} $I(radio-selected-active) \
                {active selected} $I(radio-selected-hover) \
                selected $I(radio-selected) \
                {pressed !selected} $I(scale-slider-pressed) \
                active $I(radio-unselected-hover) \
            ] -width 26 -sticky w

        # Scrollbar
        ttk::style element create Horizontal.Scrollbar.trough image $I(scrollbar-trough-horizontal) \
            -sticky ew

        ttk::style element create Horizontal.Scrollbar.thumb \
             image [list $I(scrollbar-slider-horizontal) \
                disabled $I(scrollbar-trough-horizontal) \
                pressed $I(scrollbar-slider-horizontal-pressed) \
                active $I(scrollbar-slider-horizontal-hover) \
            ] -sticky ew

        ttk::style element create Vertical.Scrollbar.trough image $I(scrollbar-trough-vertical) \
            -sticky ns

        ttk::style element create Vertical.Scrollbar.thumb \
            image [list $I(scrollbar-slider-vertical) \
                disabled  $I(scrollbar-trough-vertical) \
                pressed $I(scrollbar-slider-vertical-pressed) \
                active $I(scrollbar-slider-vertical-hover) \
            ] -sticky ns

        # Scale
        ttk::style element create Horizontal.Scale.trough \
            image [list $I(scrollbar-trough-horizontal) \
            ] -border 5 -padding 0

        ttk::style element create Horizontal.Scale.slider \
            image [list $I(scale-slider) \
                disabled $I(scale-slider-disabled) \
                pressed $I(scale-slider-pressed) \
                active $I(scale-slider-hover) \
            ] -sticky {}

        ttk::style element create Vertical.Scale.trough \
            image [list $I(scrollbar-trough-vertical) \
            ] -border 5 -padding 0

        ttk::style element create Vertical.Scale.slider \
            image [list $I(scale-slider) \
                disabled $I(scale-slider-disabled) \
                pressed $I(scale-slider-pressed) \
                active $I(scale-slider-hover) \
            ] -sticky {}

        # Entry
        ttk::style element create Entry.field \
            image [list $I(entry-basic) \
                {focus hover}    $I(entry-active) \
                invalid $I(entry-invalid) \
                disabled $I(entry-basic) \
                focus    $I(entry-active) \
                hover    $I(entry-hover)] \
            -border 5 -padding {6 8} -sticky news

        # Labelframe
        ttk::style element create Labelframe.border image $I(labelframe) \
            -border 5 -padding 4 -sticky news

        # Sizegrip
        ttk::style element create Sizegrip.sizegrip image [list $I(sizegrip)
            ] -sticky ewns

        # Separator
        ttk::style element create Horizontal.separator image $I(separator)

        ttk::style element create Vertical.separator image $I(separator)

        # Menubutton
        ttk::style configure TMenubutton -padding {8 4 4 4}

        ttk::style element create Menubutton.button \
            image [list $I(button-basic) \
                {disabled pressed} $I(button-disabled) \
                disabled $I(button-disabled) \
                pressed  $I(button-basic) \
                active   $I(button-hover) \
            ] -border 4 -sticky news 

        ttk::style element create Menubutton.indicator \
            image [list $I(arrow-down) \
                active   $I(arrow-down) \
                pressed  $I(arrow-down) \
                disabled $I(arrow-down) \
            ] -width 15 -sticky e

        # OptionMenu
        ttk::style configure TOptionMenu -padding {8 4 4 4}

        ttk::style element create OptionMenu.button \
            image [list $I(button-basic) \
                {disabled pressed} $I(button-disabled) \
                disabled $I(button-disabled) \
                pressed $I(button-basic) \
                active $I(button-hover) \
                
            ] -border 5 -sticky news 

        ttk::style element create OptionMenu.indicator \
            image [list $I(arrow-down) \
                active   $I(arrow-down) \
                pressed  $I(arrow-down) \
                disabled $I(arrow-down) \
            ] -width 15 -sticky e

        # Combobox
        ttk::style map TCombobox -selectbackground [list \
            {!focus} $colors(-selectbg) \
            {readonly hover} $colors(-selectbg) \
            {readonly focus} $colors(-selectbg) \
        ]
            
        ttk::style map TCombobox -selectforeground [list \
            {!focus} $colors(-selectfg) \
            {readonly hover} $colors(-selectfg) \
            {readonly focus} $colors(-selectfg) \
        ]

        ttk::style element create Combobox.field \
            image [list $I(entry-basic) \
                {readonly disabled} $I(button-basic) \
                {readonly pressed} $I(button-basic) \
                {readonly focus hover} $I(button-hover) \
                {readonly focus} $I(button-basic) \
                {readonly hover} $I(button-hover) \
                {focus hover} $I(entry-active) \
                readonly $I(button-basic) \
                disabled $I(entry-basic) \
                focus $I(entry-active) \
                hover $I(entry-hover) \
            ] -border 5 -padding {6 8}

        ttk::style element create Combobox.downarrow \
            image [list $I(arrow-down) \
                active $I(arrow-down) \
                pressed $I(arrow-down) \
                disabled $I(arrow-down) \
            ] -width 15 -sticky e

        # Spinbox
        ttk::style element create Spinbox.field \
            image [list $I(entry-basic) \
                disabled $I(entry-basic) \
                focus $I(entry-active) \
                hover $I(entry-hover) \
            ] -border 5 -padding {6 8} -sticky news

        ttk::style element create Spinbox.uparrow \
            image [list $I(arrow-up) \
                active $I(arrow-up-active) \
                pressed $I(arrow-up-active) \
                disabled $I(arrow-up) \
            ] -border 4 -width 15 -sticky e

        ttk::style element create Spinbox.downarrow \
            image [list $I(arrow-down) \
                active $I(arrow-down-active) \
                pressed $I(arrow-down-active) \
                disabled $I(arrow-down) \
          ] -border 4 -width 15 -sticky e
        
        # Notebook
        ttk::style element create Notebook.client \
            image $I(notebook-client) -border 4

        ttk::style element create Notebook.tab \
            image [list $I(notebook-tab-basic) \
                selected $I(notebook-tab-active) \
                active $I(notebook-tab-hover) \
            ] -border 5 -padding {12 4}

        # Progressbar
        ttk::style element create Horizontal.Progressbar.trough \
            image $I(scrollbar-trough-horizontal) -border {} -sticky ew

        ttk::style element create Horizontal.Progressbar.pbar \
            image $I(scrollbar-slider-horizontal) -border {} -sticky ew

        ttk::style element create Vertical.Progressbar.trough \
            image $I(scrollbar-trough-vertical) -border {} -sticky ns

        ttk::style element create Vertical.Progressbar.pbar \
            image $I(scrollbar-slider-vertical) -border {} -sticky ns

        # Treeview
        ttk::style element create Treeview.field \
            image $I(labelframe) -border 5

        ttk::style element create Treeheading.cell \
            image [list $I(tree-basic) \
                active $I(tree-hover)
            ] -border 5 -padding 4 -sticky ewns
        
        ttk::style element create Treeitem.indicator \
            image [list $I(arrow-right) \
                user2 $I(empty) \
                user1 $I(arrow-down) \
            ] -width 15 -sticky w

        ttk::style configure Treeview -background white
        ttk::style configure Treeview.Item -padding {2 0 0 0}
        ttk::style map Treeview \
            -background [list selected $colors(-selectbg)] \
            -foreground [list selected $colors(-selectfg)]

        # Sashes
        
        ttk::style configure TPanedwindow -width 1 -padding 0
        ttk::style map TPanedwindow -background \
            [list hover $colors(-bg)]
        
        # Set colors for other widgets
        tk_setPalette background [ttk::style lookup . -background] \
            foreground [ttk::style lookup . -foreground] \
            highlightColor [ttk::style lookup . -focuscolor] \
            selectBackground [ttk::style lookup . -selectbackground] \
            selectForeground [ttk::style lookup . -selectforeground] \
            activeBackground [ttk::style lookup . -selectbackground] \
            activeForeground [ttk::style lookup . -selectforeground]
        option add *font [ttk::style lookup . -font]
    }
}
