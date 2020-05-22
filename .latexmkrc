#!/usr/bin/env perl
$latex                       = "uplatex -kanji=utf8 -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S";
$latex_silent                = "uplatex -kanji=utf8 -synctex=1 -interaction=batchmode -halt-on-error %O %S";
$bibtex                      = "upbibtex %O %B";
$biber                       = "biber --bblencoding=utf8 -u -U --output_safechars";
$dvipdf                      = "dvipdfmx %O -o %D %S";
$makeindex                   = "upmendex %O -o %D %S";
$max_repeat                  = 5;
$pdf_mode                    = 3;
$out_dir                     = "out";
$pvc_view_file_via_temporary = 0;