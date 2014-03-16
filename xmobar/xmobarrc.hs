Config { font="xft:DejaVu Sans Mono:size=8:antialias=true:hinting=hintfull:lcdfilter=lcddefault:rgba=rgb"
       , bgColor = "black"
       , fgColor = "grey"
       , position = Top
       , lowerOnStart = True
       , commands = [ Run Weather "KPDK" ["-t","<station>: <tempF>°F, <skyCondition>","-S","True","-p","2","-L","45","-H","75","--normal","green","--high","red","--low","lightblue"] 600
                      , Run Cpu ["-t","<fc=LightBlue>Cpu</fc>: <total>","-S","True","-p","2","-L","10","-H","50","--normal","green","--high","red"] 20
                      , Run MultiCpu ["-t","<fc=LightBlue>Cpu</fc>: <autototal>","-p","2","-S","True","-m","2","-L","10","-H","50","--normal","green","--high","red"] 20
                      , Run Memory ["-t","<fc=LightBlue>Mem</fc>: <usedratio>%","-L","50","-H","80","--normal","green","--high","red"] 60
                      , Run Swap ["-t","<fc=LightBlue>Swap</fc>: <usedratio>","-p","2","-S","True"] 600
                      , Run DiskU [("/", "<fc=LightBlue>sdb1</fc>: <used>/<size>"), ("sdb1", "<usedbar>")] ["-L", "20", "-H", "50", "-m", "1", "-p", "3"] 20
                      , Run BatteryP ["BAT0","BAT1","BAT2"] ["-t","<fc=LightBlue>Batt</fc>: AC <acstatus>, <watts>, <left>, <timeleft>","-S","True","-L","20","-H","80","--low","red","--normal","green"] 20
                      , Run Date "%a %b %_d %k:%M" "date" 20
                      , Run StdinReader
                      ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %KPDK% | %cpu% | %multicpu% | %memory% * %swap% | %disku% | %battery% | <fc=#ee9a00>%date%</fc> "
       }
  