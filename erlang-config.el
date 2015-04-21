(setq load-path (cons "~/emacs/erlang"
                      load-path))
(setq erlang-root-dir "/opt/local/lib/erlang")
(setq exec-path (cons "/opt/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)