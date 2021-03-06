(defun c:ship3d( /  ip el thb p1b)
  (graphscr) (command "osnap" "none")
  (command "UCS" "W")
  (if (and (setq ip (getpoint "\nInput insertion point <exit> : "))
	   (setq thb 0.0 p1b (rpoint3d ip 250 0 0))
	   )
    (progn
      (flyship_body ip)
      (flyship_body2 ip)
      (flyship_body3 ip)
      (flyship_mast ip)
      (flyship_rod1 ip)
      (flyship_rod2 ip)
      (flyship_mast_front ip)
      (flyship_sails2 ip)
      (flyship_sails1 ip)
      (flyship_Trisail ip)
      (flyship_backsail ip)
      (command "union" "all" "") (setq el (entlast))
      ;(command "shademode" r "")
      )
    )
  (setq sc_set (list ip el p1b thb))
  (command "vpoint" "-1,-1,1")
  (command "zoom" "E" "zoom" "0.8x")
  (command "shademode" "r" "")
  (princ)
 )

;========================================================================================================

(defun flyship_body (ip / p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 ps pt c c2 r r2 e11 e12)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  ;(command "ucs" "3p" ip p1 p2)
  (setq p3 '(-115 0 0) p4 '(115 0 0)
	c '(0 193.458 0) p5 '(-115 28 0) p6 '(115 28 0)
	p7 '(-71.105 -20.072 0) p8 '(71.776 -19.847 0) p9 '(71.776 19.847 0) p10 '(-71.105 20.072 0)
	c2 '(0 -193.458 0)
	p11 '(71.776 0 0) p12 '(28.552 0 0) p13 '(33.552 0 0) p14 '(110 0 0) p15 '(114.5 0 0) 
	p16 '(71.776 -14.847 0) p17 '(71.776 14.847 0) p18 '(-71.105 15.072 0) p19 '(-71.105 -15.072 0)
	p20 '(-110 0 0) p21 '(110 0 0) ps '(115 30 0)
	pt '(-93.0525 0 0)
	r 225.058 r2 220.058
	)
  (command "arc" p3 "c" c p4 "")
  (command "line" p4 p6 p5 p3 "")
  (command "region" "all" "")
  (command "revolve" "l" "" p5 p6 "90") (setq e11 (entlast))
  (command "rectangle" p3 ps)
  (command "extrude" "l" "" '(0 0 -100))
  (command "subtract" e11 "" (entlast) "")
  (command "mirror" "l" "" p3 p4 "")
  (command "union" "all" "") (setq e12 (entlast))
  (color e12 28)
  ;(command "ucs" "p")
 )

;========================================================================================================

(defun flyship_body2 (ip / p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 ps pt c c2 r r2 e21 e22 e23 e24 e25 e26 e27 e28)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (setq p3 '(-115 0 0) p4 '(115 0 0)
	c '(0 193.458 0) p5 '(-115 28 0) p6 '(115 28 0)
	p7 '(-71.105 -20.072 0) p8 '(71.776 -19.847 0) p9 '(71.776 19.847 0) p10 '(-71.105 20.072 0)
	c2 '(0 -193.458 0)
	p11 '(71.776 0 0) p12 '(28.552 0 0) p13 '(33.552 0 0) p14 '(110 0 0) p15 '(114.5 0 0) 
	p16 '(71.776 -14.847 0) p17 '(71.776 14.847 0) p18 '(-71.105 15.072 0) p19 '(-71.105 -15.072 0)
	p20 '(-110 0 0) p21 '(110 0 0)
	pt '(-93.0525 0 0)
	r 225.058 r2 220.058
	)
  (setq co 24)
  (command "pline" p7 "a" "r" r p8 "l" p9 "a" "r" r p10 "l" "c") 
  (command "extrude" "l" "" '(0 0 10)) 
  (color (entlast) co) (setq e21 (entlast))
  (command "pline" p19 "a" "r" 220.058 p16 "l" p17 "a" "ce" c2 p18 "l" "c")
  (command "extrude" "l" "" '(0 0 10))
  (color (entlast) co) (setq e22 (entlast))
  (command "subtract" e21 "" e22 "") (setq e23 (entlast))
  ;(command "union" e2 e3 "") (setq e4 (entlast))
  ;(command "pline" p3 "a" "ce" c p7 "l" p10 "a" "ce" c2 p3 "")
  ;(command "solidedit" "b" "s" (entlast) "" 1 "" "")
  ;(command "solidedit" "b" "s" e2 "" 1 "" "")
  (command "pline" p3 "a" "r" r p7 "l" p10 "a" "r" r p3 "") (setq e24 (entlast))
  (command (command "_.-boundary" "_a" "_i" "_n" "" "" "_non" pt ""))
  (command "extrude" "l" "" '(0 0 20)) (setq e25 (entlast))
  (color (entlast) co)
  (command "erase" e24 "")
  (command "ucs" "o" '(0 0 10))
  (command "pline" p20 "a" "r" r2 p19 "l" p18 "a" "r" r2 p20 "") (setq e26 (entlast))
  (command (command "_.-boundary" "_a" "_i" "_n" "" "" "_non" pt ""))
  (command "extrude" "l" "" '(0 0 20))
  (color (entlast) co)
  (command "subtract" e25 "" (entlast) "") (setq e27 (entlast))
  (command "erase" e26 "")
  (command "union" e23 e27 "") (setq e28 (entlast))
  (command "ucs" "p")
  (command "ucs" "p")
 )
;========================================================================================================

(defun flyship_body3 (ip / p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 ps pt c c2 r r2 e31 e32)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (setq p3 '(-115 0 0) p4 '(115 0 0)
	c '(0 193.458 0) p5 '(-115 28 0) p6 '(115 28 0)
	p7 '(-71.105 -20.072 0) p8 '(71.776 -19.847 0) p9 '(71.776 19.847 0) p10 '(-71.105 20.072 0)
	c2 '(0 -193.458 0)
	p11 '(71.776 0 0) p12 '(28.552 0 0) p13 '(33.552 0 0) p14 '(110 0 0) p15 '(114.5 0 0) 
	p16 '(71.776 -14.847 0) p17 '(71.776 14.847 0) p18 '(-71.105 15.072 0) p19 '(-71.105 -15.072 0)
	p20 '(-110 0 0) p21 '(110 0 0)
	pt '(-93.0525 0 0)
	r 225.058 r2 220.058
	)
  (setq co 244)
  (command "ellipse" "c" p11 p12 19.847)
  ;(command "offset" 1 e2 p11 "")
  ;(command "line" p8 p9 "")
  ;(command "trim" p11 "" p12 "" "")
  ;(command "trim" p11 "" p12 p13 "" "" "" "trim" p14 "" p11 "" "" "")
  ;(command "region" p4 p15 p16 p17 "")
  ;(command "region" p4 p11 "")
  (command "extrude" "l" "" '(0 0 20)) (setq e31 (entlast))
  (color (entlast) co)
  (command "ucs" "o" '(0 0 10))
  (command "ellipse" "c" p11 p13 14.847)
  ;(command "line" p16 p17 "")
  ;(command "trim" p11 "" p13 "" "")
  ;(command "region" p14 p11 "")
  (command "extrude" "l" "" '(0 0 20))  (setq e32 (entlast))
  (color (entlast) co)
  
  (command "ucs" "p")
  (command "rectangle" p8 '(0 19.843 0))
  (command "extrude" "l" "" '(0 0 20))
  (command "subtract" e31 "" e32 (entlast) "")
  (command "ucs" "p")
 )

;========================================================================================================

(defun flyship_mast (ip / p1 p2 p3 p4 e41 e42 e43 cc)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (setq p3 '(55 0 0) p4 '(-60 0 0)
	)
  (setq cc 27)
  (command "circle" ip 1)
  (command "extrude" "l" "" '(0 0 150)) (setq e41 (entlast))
  (color e41 cc)
  (command "circle" p3 1)
  (command "extrude" "l" "" '(0 0 100)) (setq e42 (entlast))
  (color e42 cc)
  (command "circle" p4 1)
  (command "extrude" "l" "" '(0 0 80)) (setq e43 (entlast))
  (color e43 cc)
  (command "union" "all" "")
  (command "ucs" "p")
 )

;========================================================================================================

(defun flyship_mast_front (ip / p1 p2 p3 e51)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (command "ucs" "o" '(-115 0 0))
  (command "ucs" "y" -70)
  (command "ucs" "o" '(0 0 -3))
  (setq p3 '(0 0 0))
  (command "circle" p3 1)
  (command "extrude" "l" "" '(0 0 30)) (setq e51 (entlast))
  (command "ucs" "p")
  (command "ucs" "p")
  (command "ucs" "p")
  (color e51 27)
  (command "ucs" "p")
 )

;========================================================================================================

(defun flyship_rod1 (ip / p1 p2 p3 p4 p5 cc e61 e62 e63)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (command "ucs" "x" 90)
  (command "ucs" "o" '(0 0 -56))
  (setq p3 '(0 55 0))
  (setq cc 27)
  (command "circle" p3 1)
  (command "extrude" "l" "" '(0 0 112)) (setq e61 (entlast))
  (color (entlast) cc)
  (command "ucs" "p")
  (command "ucs" "o" '(0 0 -41))
  (setq p4 '(0 96 0))
  (command "circle" p4 1)  
  (command "extrude" "l" "" '(0 0 82)) (setq e62 (entlast))
  (color (entlast) cc)
  (command "ucs" "p")
  (command "ucs" "o" '(0 0 -21))
  (setq p5 '(0 130 0))
  (command "circle" p5 1)
  (command "extrude" "l" "" '(0 0 42)) (setq e63 (entlast))  
  (command "ucs" "p")
  (command "ucs" "p")
  (color e61 cc)
  (color e62 cc)
  (color e63 cc)
  (command "ucs" "p")
 )

;========================================================================================================

(defun flyship_rod2 (ip / p1 p2 p3 cc e71)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (command "ucs" "x" 90)
  (command "ucs" "o" '(-60 0 0))
  (command "ucs" "o" '(0 0 -41))
  (setq p3 '(0 70 0))
  (setq cc 27)
  (command "circle" p3 1)
  (command "extrude" "l" "" '(0 0 82)) (setq e71 (entlast))
  (command "ucs" "p")
  (command "ucs" "p")
  (command "ucs" "p")
  (color e71 27)
  (command "ucs" "p")
 )

;========================================================================================================

(defun flyship_sails2 (ip / p1 p2 p3 co e81 e82 e83)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (command "ucs" "y" -90)
  (command "ucs" "o" '(55 0 0))
  (setq p3 '(0 0 0))
  (setq co 254)
  (command "rectangle" '(0.5 -55 0) '(-0.5 55 0))
  (command "revolve" "l" "" '(-23 0 0) '(-23 10 0) "-180") (setq e81 (entlast))
  (color (entlast) co)
  (command "ucs" "o" '(41 0 0))
  (setq p3 '(0 0 0))
  (command "rectangle" '(0.5 -40 0) '(-0.5 40 0))
  (command "revolve" "l" "" '(-18 0 0) '(-18 10 0) "-180") (setq e82 (entlast))
  (changecolor (entlast) co)
  (command "ucs" "o" '(34 0 0))
  (setq p3 '(0 0 0))
  (command "rectangle" '(0.5 -20 0) '(-0.5 20 0))
  (command "revolve" "l" "" '(-15 0 0) '(-15 10 0) "-180") (setq e83 (entlast))
  (color (entlast) co)
  (command "ucs" "p")
  (command "ucs" "p")
  (command "ucs" "p")
  (command "ucs" "p")
  (color e81 co)
  (color e82 co)
  (color e83 co)
  (command "ucs" "p")
 )

;========================================================================================================

(defun flyship_sails1 (ip / p1 p2 p3 co e91)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (command "ucs" "o" '(-61 0 0))
  (command "ucs" "y" -90)
  (command "ucs" "o" '(70 0 0))
  (setq p3 '(0 0 0))
  (setq co 254)
  (command "rectangle" '(0.5 -40 0) '(-0.5 40 0))
  (command "revolve" "l" "" '(-26 0 0) '(-26 10 0) "-180") (setq e91 (entlast))
  (command "ucs" "p")
  (command "ucs" "p")
  (command "ucs" "p")
  (color e91 co)
  (command "ucs" "p")
 )
;========================================================================================================

(defun flyship_Trisail (ip / p1 p2 p3 co e101)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (command "ucs" "o" '(-0.5 -0.5 0))
  (command "ucs" "x" 90)
  (setq p3 '(0 0 0))
  (setq co 254)
  (command "pline" '(-87 31 0) '(-140 10 0) '(-82 67.5 0) "a" "r" 65 '(-87 31 0) "")
  (command "extrude" "l" "" '(0 0 -1)) (setq e101 (entlast))
  (command "ucs" "p")
  (command "ucs" "p")
  (color e101 co)
  (command "ucs" "p")
 )
;========================================================================================================

(defun flyship_backsail (ip / p1 p2 p3 co e111)
  (setq p1 (rpoint3d ip 10 0 0) p2 (rpoint3d ip 0 10 0))
  (command "ucs" "3p" ip p1 p2)
  (command "ucs" "o" '(56 0 0))
  (command "ucs" "o" '(0 -0.5 0))
  (command "ucs" "x" 90)
  (setq p3 '(0 0 0))
  (setq co 254)
  (command "pline" '(0 84 0) '(39 96 0) '(39 14 0) '(0 14 0) '(0 84 0) "")
  (command "extrude" "l" "" '(0 0 -1)) (setq e111 (entlast))
  (command "ucs" "p")
  (command "ucs" "p")
  (command "ucs" "p")
  (color e111 co)
  (command "ucs" "p")
 )

;========================================================================================================

(defun color (ss att / sse sf cur veo tc ci opt el sse_el sf_el veo1 tc1 ci1)
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
(setq opt att) ; check if user put value and hit
; enter,program would repeat again.
; if user only hit enter the program
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
(princ)
)

;========================================================================================================

(defun c:rm (/ e1 pci p1 th p2 ainc len r dth thb)
  (graphscr)
  (setq pci (car sc_set) p1 (nth 2 sc_set) e1 (nth 1 sc_set) r (/ 125 2.0)
	th (nth 3 sc_set)
	ainc 10 len 5
  )
  
  (princ "\n Press <A> clockwise")
  (princ ", Press <D> to rotate counter clockwise")
  (princ ", Press <W> to go forward")
  (princ ", Press <S> to go backward")
  (princ ", Press <ENTER> to end !")
  (setvar "cmdecho" 0)
  (while (and (setq key (cadr (grread))) (/= 13 key) )
    (if (= key 100) (progn (setq dth ainc)
		      (command "rotate" e1 "" p1 dth)
		      (setq th (+ th (dtr dth)))
                      (setq pci (polar p1 th r))
		      
      )
      );Press <A> clockwise
    (if (= key 97) (progn (setq dth (- ainc))
		     (command "rotate" e1 "" p1 dth)
		     (setq th (+ th (dtr dth)))
                     (setq pci (polar p1 th r))
      )
      );Press <D> to rotate counter clockwise
    (if (= key 119) (progn
		      (setq p2 (polar pci th (- len)))
		      (command "move" e1 "" pci p2)
		      (setq pci p2)
                      (setq p1 (polar pci th (- r)))
		      )
      );Press <W> to go forward
    (if (= key 115) (progn
		      (setq p2 (polar pci th len))
		      (command "move" e1 "" pci p2)
		      (setq pci p2)
                      (setq p1 (polar pci th (- r)))
		      )
      );Press <S> to go backward
    );end-while
  (setq sc_set (list pci e1 p1 th)); update the globle values
  )

;==========================================================
; return a selection set after e1 until e2
(defun sset (e1 e2 / ss)
  (setq e1 (if e1 (entnext e1) (entnext))
        ss (ssadd e1)  )
  (while (not (equal e1 e2))
     (setq e1 (entnext e1)  ss (ssadd e1 ss)   )
  )
  ss ;return value
)

