# VIM Cheatsheet

## Cursor movement

    h/j/k/l - left/down/up/right
    w/b/e - Next/previous/end word
    W/B - Next/previous word (space seperated)
    0/$ - Start/End of line
    
    Ctrl+d - Move down half a page
    Ctrl+u - Move up half a page
    } - Go forward by paragraph (the next blank line)
    { - Go backward by paragraph (the next blank line)
    gg - Go to the top of the page
    G - Go the bottom of the page
    : [num] [enter] - Go to that line in the document
    ctrl+e / ctrl+y - Scroll down/up one line

## Editing text

    i/a - Start/End of line
    I/A - Start insert mode at the beginning/end of the line
    o/O - Add blank line below/above current line
    d - Delete
    dd - Delete line
    c - Delete, then start insert mode
    cc - Delete line, then start insert mode

## Operators

Operators also work in Visual Mode.
You can also combine operators with motions.
Ex: d$ deletes from the cursor to the end of the line.

    d - Deletes from the cursor to the movement location
    c - Deletes from the cursor to the movement location, then starts insert mode
    y - Copy from the cursor to the movement location
    > - Indent one level
    < - Unindent one level

## Marking text (visual mode)

    v - Start visual mode
    V - Start linewise visual mode
    Ctrl+v - Start visual block mode

## Clipboard

d/c - By default, these copy the deleted text

    yy - Yank (copy) a line
    p - Paste after cursor
    P - Paste before Cursor
    dd - Delete (cut) a line
    x - Delete (cut) current character
    X - Delete (cut) previous character

## General

    u - Undo
    Ctrl+r - Redo
