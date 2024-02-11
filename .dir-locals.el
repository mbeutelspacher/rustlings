((nil . ((eval . (progn
                   (local-set-key (kbd "<f5>")
                                  (lambda ()
                                    (interactive)
                                    (save-excursion
                                      (goto-char (point-min))
                                      (while (search-forward "// I AM NOT DONE" nil t)
                                        (replace-match ""))
                                      (save-buffer)
                                      (cd "~/git/rustlings")
                                      (let ((output (shell-command-to-string "rustlings list")))
                                        (when (string-match "^.*Pending$" output)
                                          (let* ((lines (split-string output "\n"))
                                                 (pending-line (car (cl-remove-if-not (lambda (line) (string-match "Pending$" line)) lines))))
                                            (when pending-line
                                              (let* ((file-path (nth 1 (split-string pending-line)))
                                                     (full-path (concat "~/git/rustlings/" file-path)))
                                                (find-file full-path))))))))))))))
