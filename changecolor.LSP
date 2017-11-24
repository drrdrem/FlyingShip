(defun c:eoc (/ ss sse sf cur veo tc ci att opt el sse_el sf_el veo1 tc1
ci1)
(if
(setq ss (car (entsel "\nSelect a object")))
(progn
(setq sse (entget ss))
(setq sf (cdr (assoc 62 sse)))
(if
sf
(setq cur (itoa sf))
(progn
(vl-load-com)
(setq veo (vlax-ename->vla-object ss))
(setq tc (vlax-get-property veo 'TrueColor))
(setq ci (vlax-get-property tc 'ColorIndex))
(setq cur (itoa ci))
) ; progn
) ; if
(setq att "\nEnter new value of color")
(setq opt
(fix
(getreal
(strcat att " <" cur ">: ")))) ; check if user put value and hit
; enter,program would repeat
again.
; if user only hit enter the
program
; would stop
(cond ((= opt nil)(setq sf sf))
((/= opt nil)(setq sf opt)))
(command "_change" ss "" "p" "c" sf "")
(setq el (entlast))
(setq sse_el (entget el))
(setq sf_el (cdr (assoc 62 sse_el)))
(if
sf
(setq cur (itoa sf))
(progn
(vl-load-com)
(setq veo1 (vlax-ename->vla-object ss))
(setq tc1 (vlax-get-property veo 'TrueColor))
(setq ci1 (vlax-get-property tc 'ColorIndex))
(setq cur (itoa ci))
) ; progn
) ; if

) ; progn
(alert "\nInvalid selected object,please try again")
) ; if
(princ)
)