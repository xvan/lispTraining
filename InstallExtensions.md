New Method:

ext install rheller.alive


Install QuickLisp, then run these on a repl 

    (ql:quickload "bordeaux-threads")
    (ql:quickload "usocket")
    (ql:quickload "cl-json")
    (ql:quickload "flexi-streams")


Old Method:


1) Install Roswell
2) Downgrade sbcl:

    ros install sbcl/2.1.1
    ros install sbcl-bin/2.1.1
    ros use sbcl/2.1.1
    ros use sbcl-bin/2.1.1

3) Install Language Server
    ros install ailisp/linedit
    ros install ailisp/prepl
    ros install ailisp/cl-lsp

4) Install Extensions
    ext install ailisp.strict-paredit
    ext install ailisp.commonlisp-vscode
