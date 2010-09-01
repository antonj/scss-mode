;;; scss-mode.el 

;; Copyright (C) 2002 - 2015 Anton Johansson <anton.johansson@gmail.com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; Homepage: http://antonj.se
;; Created: Sep 1 23:11:26 2010
;; Version: 0.1
;; Keywords: mode css scss

;; Info ;;;;;;;;;;;;;;;;
;; Command line utility sass is required, see
;; http://sass-lang.com/ for installation To install scssc do : sudo
;; gem install scss

;;;###autoload
(require 'derived)

(defconst scss-font-lock-keywords
  '(("\$[^\s:;]+" . font-lock-constant-face)))

;;;###autoload (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
;;;###autoload
(define-derived-mode scss-mode css-mode "Scss"
  "Major mode for editing Scss files, http://sass-lang.com/"
  (font-lock-add-keywords nil scss-font-lock-keywords)
  (add-hook 'after-save-hook 'scss-parse nil t))

(defun scss-parse()
    (compile (concat "sass "
          (buffer-name) " "
          (first (split-string (buffer-name) ".scss")) ".css")))

(provide 'scss-mode)