;;; evil-collection-indium.el --- Bindings for `indium'. -*- lexical-binding: t -*-

;; Copyright (C) 2017 James Nguyen

;; Author: James Nguyen <james@jojojames.com>
;; Maintainer: James Nguyen <james@jojojames.com>
;; Pierre Neidhardt <ambrevar@gmail.com>
;; URL: https://github.com/jojojames/evil-collection
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; Keywords: emacs, indium, javascript, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;; Bindings for `indium'.

;;; Code:
(require 'evil)
(require 'indium nil t)

(defun evil-collection-indium-setup ()
  "Set up `evil' bindings for `indium'."
  (evil-define-key 'normal indium-debugger-mode-map
    "n" 'indium-debugger-step-over
    "i" 'indium-debugger-step-into
    "o" 'indium-debugger-step-out
    "c" 'indium-debugger-resume
    "L" 'indium-debugger-locals
    "s" 'indium-debugger-stack-frames
    "q" 'indium-debugger-resume
    "H" 'indium-debugger-here
    "e" 'indium-debugger-evaluate
    ">" 'indium-debugger-next-frame
    "<" 'indium-debugger-previous-frame)

  (add-hook 'indium-debugger-mode-hook #'evil-normalize-keymaps)

  (evil-define-key 'normal indium-inspector-mode-map
    (kbd "RET") 'indium-follow-link
    [mouse-1] 'indium-follow-link
    "L" 'indium-inspector-pop
    "gr" 'indium-inspector-refresh
    "gj" 'indium-inspector-next-reference
    "gk" 'indium-inspector-previous-reference
    (kbd "C-j") 'indium-inspector-next-reference
    (kbd "C-k") 'indium-inspector-previous-reference
    [tab] 'indium-inspector-next-reference
    [backtab] 'indium-inspector-previous-reference)

  (evil-define-key 'normal indium-debugger-locals-mode-map
    "L" nil
    "gr" nil)

  (evil-define-key 'normal indium-debugger-frames-mode-map
    [return] 'indium-follow-link
    (kbd "RET") 'indium-follow-link
    (kbd "gj") 'indium-debugger-frames-next-frame
    (kbd "gk") 'indium-debugger-frames-previous-frame
    (kbd "C-j") 'indium-debugger-frames-next-frame
    (kbd "C-k") 'indium-debugger-frames-previous-frame
    [tab] 'indium-debugger-frames-next-frame
    [backtab] 'indium-debugger-frames-previous-frame)

  (evil-define-key 'normal indium-interaction-mode-map
    "gr" 'indium-update-script-source
    "gz" 'indium-switch-to-repl-buffer)

  (evil-define-key 'normal indium-repl-mode-map
    (kbd "gj") 'indium-repl-next-input
    (kbd "gk") 'indium-repl-previous-input
    (kbd "C-j") 'indium-repl-next-input
    (kbd "C-k") 'indium-repl-previous-input))

(provide 'evil-collection-indium)
;;; evil-collection-indium.el ends here
