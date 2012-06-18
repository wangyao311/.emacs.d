;;;=====================��Emacs����C/C++���  http://www.caole.net/diary/emacs_write_cpp.html#sec-4_2========================

(provide 'caole_config)


;;C/Cpp mode
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;;;;�ҵ�C/C++���Ա༭����

(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  ;;��������
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

  
 ;;Ԥ��������
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;;�ҵ�C++���Ա༭����
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
) 

;;����semantic������Χ
(setq semanticdb-project-roots 
      (list
        (expand-file-name "/")))

;;�Զ��岹ȫ��� ����������м�Ͳ�ȫ�������tab		
(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
      (hippie-expand nil)
      (indent-for-tab-command))
 )

 ;;��ȫ��ݼ��� ctrl-tab��senator��ȫ������ʾ�б�
 ;;alt+/��ȫ����ʾ�б���ѡ��
;'(global-set-key [(control tab)] 'my-indent-or-complete)
;(autoload 'senator-try-expand-semantic "senator")
;(setq hippie-expand-try-functions-list
;      '(
;        senator-try-expand-semantic
;        try-expand-dabbrev
;        try-expand-dabbrev-visible
;        try-expand-dabbrev-all-buffers
;        try-expand-dabbrev-from-kill
;        try-expand-list
;        try-expand-list-all-buffers
;        try-expand-line
;        try-expand-line-all-buffers
;        try-complete-file-name-partially
;        try-complete-file-name
;        try-expand-whole-kill
;        )
;)

(global-set-key [(f5)] 'speedbar)
(define-key c-mode-base-map [(f7)] 'compile)
'(compile-command "make")

;;;=====================��Emacs����C/C++���  http://www.caole.net/diary/emacs_write_cpp.html#sec-4_2========================