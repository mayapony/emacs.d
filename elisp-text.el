;; current cursor postion is called point
(point)

;; return position of the beginning/end of the region (selection)
(region-beginning) (line-beginning-position)
(region-end)

;; return the position of then beginning/end of the buffer
(point-min)

;; move cursor to position 10
(goto-char 10)

;; move cursor by 4 chars
(forward-char 4)

(search-forward "some")  ;;some of comments

(re-search-forward "[0-9]") ;; use regex

