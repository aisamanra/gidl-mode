;; gidl-mode.el --- a simple major mode for editing GIDL files.

;; Version: 20150507.0001
;; Author: Getty Ritter
;; Url: https://github.com/aisamanra/gidl-mode

(setq gidl-font-lock
  '(( "def-\\(enum\\|struct\\|newtype\\|interface\\)"
      . font-lock-keyword-face )
    ( "def-\\(enum\\|struct\\|newtype\\|interface\\) (?\\([A-Za-z0-9_-]*\\)"
      2 font-lock-function-name-face )
    ( "[us]int\\(8\\|16\\|32\\|64\\)_t\\|bool_t\\|float_t\\|double_t"
      . font-lock-builtin-face)))

(defvar gidl-syntax-table nil "Syntax table for `gidl-mode'.")
(setq gidl-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?- ". 12b" table)
    (modify-syntax-entry ?\n "> b" table)
    (modify-syntax-entry ?( "($")
    (modify-syntax-entry ?) ")^")

    table))

(define-derived-mode gidl-mode prog-mode
  "GIDL mode is a major mode for editing GIDL files"
  :syntax-table gidl-syntax-table

  (setq font-lock-defaults '(gidl-font-lock))
  (setq mode-name "GIDL mode")
  (setq comment-start "--")
  (setq comment-end ""))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.i?g?idl\\'" . gidl-mode))

(provide 'gidl-mode)

;;; gidl-mode.el ends here
