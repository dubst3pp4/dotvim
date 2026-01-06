" Nützliche Einstellungen für Oberon
setlocal shiftwidth=2     " Wirth-Standard ist oft 2 oder 3 Leerzeichen
setlocal softtabstop=2
setlocal expandtab        " Leerzeichen statt echte Tabs (empfohlen für voc)
setlocal nosmartindent    " Oberon-Einrückung ist manchmal eigenwillig

" Automatische Großschreibung (Abbreviations)
iabbrev <buffer> module MODULE
iabbrev <buffer> begin BEGIN
iabbrev <buffer> end END
iabbrev <buffer> procedure PROCEDURE
iabbrev <buffer> import IMPORT
iabbrev <buffer> type TYPE
iabbrev <buffer> var VAR
iabbrev <buffer> record RECORD
iabbrev <buffer> pointer POINTER
iabbrev <buffer> to TO
iabbrev <buffer> if IF
iabbrev <buffer> then THEN
iabbrev <buffer> else ELSE
iabbrev <buffer> elsif ELSIF
iabbrev <buffer> while WHILE
iabbrev <buffer> do DO
iabbrev <buffer> loop LOOP
iabbrev <buffer> exit EXIT
iabbrev <buffer> return RETURN
iabbrev <buffer> array ARRAY
iabbrev <buffer> of OF
iabbrev <buffer> const CONST
iabbrev <buffer> nil NIL
iabbrev <buffer> true TRUE
iabbrev <buffer> false FALSE
